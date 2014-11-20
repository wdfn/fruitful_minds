#ifndef SMTP_H
#define SMTP_H

#include <stddef.h>
#include <stdint.h>
#include <netinet/in.h>

struct smtpc {
	in_addr_t addr;
	in_port_t port;
	const char *user;
	const char *pass;
	size_t ulen;
	size_t plen;
};

#define SMTPC_INIT(a,p,un,pw)  {\
	.addr = (a), .port = (p),\
	.user = un, .ulen = (sizeof(un) - 1),\
	.pass = pw, .plen = (sizeof(pw) - 1),\
	}

struct email {
	struct mailbox {
		const char *addr;
		size_t len;
	} *to;
	struct mailbox from;
	const char *msg;
	size_t len;
	unsigned int rcpts;
};

#define EMAIL_ADDR(s)  { .addr = s, .len = (sizeof(s) - 1) }
#define EMAIL_INIT(f,...)  {\
	.to = (struct mailbox[]) { __VA_ARGS__ },\
	.from = f, .msg = NULL, .len = 0,\
	.rcpts = (sizeof((struct mailbox[]) { __VA_ARGS__ }) / sizeof(struct mailbox)),\
	}

extern int smtpc_send(const struct smtpc *, const struct email *);

#define CRLF "\x0D\x0A"

#endif /* SMTP_H */
