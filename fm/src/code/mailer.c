#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* POSIX */
#include <unistd.h>

#include "stdlog.h"
#include "adt.h"
#include "form.h"
#include "smtp.h"

#ifndef APPNAME
#define APPNAME "mailer"
#endif /* APPNAME */
#ifndef LOGFILE_MAIL
#define LOGFILE_MAIL "/home2/fruitful/logs/mail.log"
#endif /* LOGFILE_MAIL */

#define FM_SNDR_NAME "FM Mailer"
#define FM_SNDR_ADDR "postmaster@fruitfulminds.org"
#define FM_RCPT_ADDR "allyson@fruitfulminds.org"
#define FM_RCPT_NAME "Fruitful Minds staff"
#define FM_ROOT_ADDR "a_ou@berkeley.edu"
#define FM_ROOT_NAME "root"
#define FM_MAXLEN 4096

static struct smtpc fm = SMTPC_INIT(
	0x7F000001, 25, FM_SNDR_ADDR, "c1tru$");
static struct email mail = EMAIL_INIT(
	EMAIL_ADDR(FM_SNDR_ADDR),
	EMAIL_ADDR(FM_RCPT_ADDR),
	EMAIL_ADDR(FM_ROOT_ADDR));

static int _contact(str_t *name, str_t *subj, str_t *body,
                    str_t *addr, str_t *tel) {
	static const char mail_hdr[] =
		"MIME-Version: 1.0" CRLF
		"Content-Type: text/plain; charset=utf8" CRLF
		"From: " FM_SNDR_NAME " <" FM_SNDR_ADDR ">" CRLF
		"To: "   FM_RCPT_NAME " <" FM_RCPT_ADDR ">" CRLF
		"Cc: "   FM_ROOT_NAME " <" FM_ROOT_ADDR ">" CRLF
		"Subject: [Fruitful Minds] ";
	static const char mail_sub[] = "First contact";
	static const char mail_replyto[] = CRLF "Reply-To: ";
	static const char line_sig[] = CRLF CRLF "-- " CRLF;
	static const char line_addr[] = CRLF "mailto:"; 
	static const char line_tel[] = CRLF "tel:";
	str_t msg;
	size_t len;

	len = (sizeof(mail_hdr) - 1) + (sizeof(line_sig) - 1)
	      + (sizeof(line_addr) - 1) + name->len + body->len + addr->len;
	len += (subj != NULL) ? subj->len : (sizeof(mail_sub) - 1);
	len += (tel != NULL) ? (sizeof(line_tel) - 1) + tel->len : 0;

	if (sd_alloc(&msg, len) != 0)
		return -1;
	if (sd_litcat(&msg, mail_hdr)
		/* Complete "Subject" header field */
	    || (subj != NULL && sa_len(subj) > 0
	        ? sd_memcat(&msg, sa_str(subj), sa_len(subj))
	        : sd_litcat(&msg, mail_sub))
		/* Append "Reply-To" header field */
		|| sd_litcat(&msg, mail_replyto)
		|| sd_memcat(&msg, sa_str(addr), sa_len(addr))
		/* Compose message text */
		|| sd_litcat(&msg, CRLF CRLF)
	    || sd_memcat(&msg, sa_str(body), sa_len(body))
	    || sd_litcat(&msg, line_sig)
	    || sd_memcat(&msg, sa_str(name), sa_len(name))
	    || sd_litcat(&msg, line_addr)
	    || sd_memcat(&msg, sa_str(addr), sa_len(addr))
	    || (tel != NULL &&
	        (sd_litcat(&msg, line_tel)
	        || sd_memcat(&msg, sa_str(tel), sa_len(tel))))
	    || sd_litcat(&msg, CRLF)
		/* Send message */
		|| (mail.msg = sd_buf(&msg), mail.len = sa_len(&msg),
		    smtpc_send(&fm, &mail) != 0)) {

		sd_free(&msg);
		return -1;
	}
	sd_free(&msg);
	return 0;
}

static void _doc_header(const char *title, unsigned int pause,
                        const char *redirect) {
	fprintf(stdout,
		"Content-Type: text/html" CRLF CRLF
		"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
		"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\n"
		"\thttp://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n"
		"<html xmlns=\"http://www.w3.org/1999/xhtml\">"
		"<head>" 
			"<title>%s | Fruitful Minds</title>"
			"<meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />"     
			"<meta http-equiv=\"Refresh\" content=\"%u; url=%s\" />"
		"</head>" 
		"<body>", title, pause, redirect);
}

static void _doc_footer(void) {
	fprintf(stdout, "</body></html>\n");
	fflush(stdout);
}

static void _doc_error(const char *msg) {
	_doc_header("Message delivery failure", 8, "/contact.html");
	fprintf(stdout,
		"<p>Delivery could not be completed due to the following error:</p>"
		"<blockquote><code>%s</code></blockquote>"
		"<p>Please return to the <a href=\"http://www.fruitfulminds.org"
		"/contact.html\">Fruitful Minds contact page</a> and try again.<br />"
		"Sorry for the inconvenience!</p>", msg);
	_doc_footer();
}

static void _doc_success(void) {
	_doc_header("Message delivered", 5, "/index.html");
	fputs("<p>Your message was successfully sent. "
		"Thank you for you interest in "
		"<a href=\"http://fruitfulminds.org/\">Fruitful Minds</a>!</p>", stdout);
	_doc_footer();
}

int main(void) {
	char *str;
	size_t len;
	htb_t form;
	str_t *name;
	str_t *subj;
	str_t *body;
	str_t *addr;
	str_t *tel;

	stdlog_fopen(APPNAME, LOGFILE_MAIL);
	stdlog_cgi();
	if ((str = getenv("CONTENT_TYPE")) == NULL
	    || strcmp(str, "application/x-www-form-urlencoded") != 0
	    || (str = getenv("CONTENT_LENGTH")) == NULL
	    || (len = strtol(str, NULL, 10)) == 0) {
		stdlog("invalid Content-Type or Content-Length field\n");
		_doc_error("Invalid request received");
		return 1;
	}
	if (len > FM_MAXLEN) {
		stdlog("exceeded maximum message length: %zu\n", len);
		_doc_error("Message exceeds maximum allowable length");
		return 1;
	}
	if ((str = malloc(len * sizeof(char))) == NULL
	    || read(STDIN_FILENO, str, len) != (ssize_t)(len)) {
		stdlog("failed to read stdin stream\n");
		_doc_error("Internal server error");
		return 1;
	}
	stdlog("stdin: %zu \"%s\"\n", len, str);
	if (query_decode(str, len, &form) != 0) {
		stdlog("failed to decode percent-encoded form data\n");
		_doc_error("Invalid request received");
		return 1;
	}

	name = ht_gets(&form, "name");
	subj = ht_gets(&form, "subject");
	body = ht_gets(&form, "message");
	addr = ht_gets(&form, "address");
	tel = ht_gets(&form, "phone");
	if (name == NULL || name->len <= 0
	    || body == NULL || body->len <= 0
	    || addr == NULL || addr->len <= 0) {
		stdlog("missing required form field\n");
		_doc_error("Required form field is empty");		
		return 1;
	}
	if (_contact(name, subj, body, addr, tel) != 0) {
		stdlog("SMTP session failed\n");
		_doc_error("Internal server error");
		return 1;
	}
	ht_free(&form);
	_doc_success();
	return 0;
}
