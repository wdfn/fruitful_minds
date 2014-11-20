#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#ifdef DEBUG
#include <stdio.h>
#endif /* DEBUG */

/* POSIX */
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include "base64.h"
#include "smtp.h"
#include "stdlog.h"

#ifndef SMTP_CLIENT_DOMAIN
#define SMTP_CLIENT_DOMAIN "fruitfulminds.org"
#endif /* SMTP_CLIENT_DOMAIN */

static int _smtpc_connect(const struct smtpc *serv) {
	int fd;
	struct sockaddr_in sa;

	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = htonl(serv->addr);
	sa.sin_port = htons(serv->port);
	fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (fd < 0)
		return -1;
	if (connect(fd, (struct sockaddr *)(&sa),
	            sizeof(struct sockaddr_in)) != 0) {
		close(fd);
		return -1;
	}
	return fd;
}

static int _smtpc_reply(int fd) {
	char buf[512];
	char *str;
	ssize_t len;
	int rc, more;

	if ((len = recv(fd, buf, sizeof(buf) - 1, 0)) <= 0
	    || (buf[len] = '\0', rc = strtol(buf, NULL, 10)) == 0) {
		return -1;
	}
	str = buf;
#ifdef DEBUG
	fputs(buf, stderr);
#endif
	do {
		/* Consume reply code */
		for (;;) {
			if (len <= 0) { /* Refill buffer */
				if ((len = recv(fd, buf, sizeof(buf), 0)) <= 0)
					return -1;
				str = buf;
#ifdef DEBUG
				fputs(buf, stderr);
#endif /* DEBUG */
			}
			if ((unsigned char)(*str - '\x30') > 0x09)
				break;
			str++; len--;
		}
		/* Hyphen after reply code indicates multiline reply */
		more = (*str == '\x2D');
		for (;;) {
			if (len < 2) { /* Refill buffer */
				/* Retain the last char from the previous buffer,
				   which handles the special case in which the CRLF
				   sequence was split across adjacent buffers */
				buf[0] = *str;
				if ((len = recv(fd, buf + 1, sizeof(buf) - 1, 0)) <= 0)
					return -1;
				len++;
				str = buf;
#ifdef DEBUG
				fputs(buf, stderr);
#endif /* DEBUG */
			}
			if (str[0] == '\x0D' && str[1] == '\x0A') {
				str += 2;
				len -= 2;
				break;
			}
			str++; len--;
		}
	} while (more);
	return rc;
}

static int _smtpc_auth_plain(int fd, const struct smtpc *serv) {
	static char cmd_auth[] = "AUTH PLAIN ";
	size_t blen, clen;
	char *str;
	blen = serv->ulen + serv->plen + 2;
	clen = sizeof(cmd_auth) + B64_ELEN(blen) + 1;
	char buf[blen];
	char cmd[clen];

	str = buf;
	*str++ = '\0';
	memcpy(str, serv->user, serv->ulen);
	str += serv->ulen;
	*str++ = '\0';
	memcpy(str, serv->pass, serv->plen);

	memcpy(cmd, cmd_auth, sizeof(cmd_auth) - 1);
	clen = base64_encode(buf, blen, cmd + (sizeof(cmd_auth) - 1));
	if (clen == 0)
		return -1;
	clen += sizeof(cmd_auth) + 1;
	cmd[clen - 2] = '\x0D';
	cmd[clen - 1] = '\x0A';
	return (send(fd, cmd, clen, 0) == (ssize_t)(clen)
	       && _smtpc_reply(fd) == 235) ? 0 : -1;
}

static size_t memcat(void *buf, size_t n, ...) {
	va_list ap;
	char *ptr;
	va_start(ap, n);
	for (ptr = (char *)buf;;) {
		const char *str;
		size_t len;
		if ((str = va_arg(ap, const char *)) == NULL)
			break;
		if ((len = va_arg(ap, size_t)) > n)
			return 0;
		memcpy(ptr, str, len);
		n -= len;
		ptr += len;
	}
	va_end(ap);
	return (ptr - (char *)buf);
}

#define SMTP_CMDMAXLEN   512
#define SMTP_LINEMAXLEN 1000
static int _smtpc_mail(int fd, const struct email *mail) {
	static char cmd_mail[] = "MAIL FROM:<";
	static char cmd_rcpt[] = "RCPT TO:<";
	static char cmd_data[] = "DATA\x0D\x0A";
	static char addr_end[] = ">\x0D\x0A";
	static char data_end[] = ".\x0D\x0A";

	char cmd[SMTP_CMDMAXLEN];
	const char *msg;
	size_t len;
	int i;

	/* MAIL */
	len = memcat(cmd, sizeof(cmd),
	             cmd_mail, sizeof(cmd_mail) - 1,
	             mail->from.addr, mail->from.len,
	             addr_end, sizeof(addr_end) - 1, NULL);
	if (len == 0 || send(fd, cmd, len, 0) != (ssize_t)(len)
	    || _smtpc_reply(fd) != 250) {
		return -1;
	}
	/* RCPT */
	for (i = mail->rcpts; i-- > 0;) {
		len = memcat(cmd, sizeof(cmd),
		             cmd_rcpt, sizeof(cmd_rcpt) - 1,
		             mail->to[i].addr, mail->to[i].len,
		             addr_end, sizeof(addr_end) - 1, NULL);
		if (len == 0 || send(fd, cmd, len, 0) != (ssize_t)(len)
		    || _smtpc_reply(fd) != 250) {
			return -1;
		}
	}

	/* DATA */
	if (send(fd, cmd_data, sizeof(cmd_data) - 1, 0)
	       != (sizeof(cmd_data) - 1)
		|| _smtpc_reply(fd) != 354) {
		return -1;
	}
	msg = mail->msg;
	len = mail->len;
	while (len > 0) {
		const char *ptr;
		const char *stop;
		size_t llen;
		int crlf;

		/* Leading dot to avoid forbidden <CRLF>.<CRLF>
		   sequence in data (RFC 5321 Section 4.5.2) */
		if (*msg == '.' && send(fd, ".", 1, 0) != 1)
			return -1;

		/* Determine end of line */
		llen = ((len >= SMTP_LINEMAXLEN) ? SMTP_LINEMAXLEN - 2 : len - 2);
		stop = msg + llen;
		for (ptr = msg, crlf = 0; ptr <= stop; ptr++) {
			if (ptr[0] == '\x0D' && ptr[1] == '\x0A') {
				/* Include CRLF */
				llen = (ptr + 2) - msg;
				crlf = 1;
				break;
			}
		}
		/* Special case: write remainder */
		if (!crlf && len <= SMTP_LINEMAXLEN - 2)
			llen = len;
		stdlog_write(msg, llen);
		if (send(fd, msg, llen, 0) != (ssize_t)(llen)
		    || (!crlf && send(fd, "\x0D\x0A", 2, 0) != 2)) {
			return -1;
		}
		msg += llen;
		len -= llen;
	}
	/* Terminator */
	if (send(fd, data_end, sizeof(data_end) - 1, 0)
	       != (sizeof(data_end) - 1)
	    || _smtpc_reply(fd) != 250) {
		return -1;
	}
	return 0;
}

int smtpc_send(const struct smtpc *serv, const struct email *mail) {
	static char cmd_ehlo[] = "EHLO " SMTP_CLIENT_DOMAIN "\x0D\x0A";
	static char cmd_quit[] = "QUIT\x0D\x0A";
	int fd;
	
	fd = _smtpc_connect(serv);
	if (fd < 0)
		return -1;
	if (_smtpc_reply(fd) != 220
	    || send(fd, cmd_ehlo, sizeof(cmd_ehlo) - 1, 0)
	       != (sizeof(cmd_ehlo) - 1)
	    || _smtpc_reply(fd) != 250
	    || _smtpc_auth_plain(fd, serv) != 0
		|| _smtpc_mail(fd, mail) != 0
	    || send(fd, cmd_quit, sizeof(cmd_quit) - 1, 0)
	       != (sizeof(cmd_quit) - 1)
	    || _smtpc_reply(fd) != 221) {
		close(fd);
		return -1;
	}
	close(fd);
	return 0;
}
