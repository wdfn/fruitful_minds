#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdio.h>

#include "adt.h"

const str_t strnul = { .len = 0, .str.mem = "\0" };

#define sd_setlen(s,n)	((s)->len = (n))
#define sd_setbuf(s,b)	((s)->str.buf = (b))

int sd_alloc(str_t *s, size_t n) {
	str_t *buf;
	if ((buf = sa_alloc(n + 1)) == NULL)
		return -1;
	sa_setlen(buf, n);
	sd_setbuf(s, buf);
	sd_setlen(s, 0);
	return 0;
}

void sd_free(str_t *s) {
	sa_free(s->str.buf);
	s->str.buf = NULL;
	sd_setlen(s, 0);
}

static inline int _sd_realloc(str_t *s, size_t len) {
	str_t *nbuf;
	size_t ncap;
	ncap = sd_cap(s);
	do {
		ncap <<= 1;
	} while (ncap <= len);
	nbuf = realloc(s->str.buf, sizeof(size_t) + (ncap + 1));
	if (nbuf == NULL)
		return -1; 
	sa_setlen(nbuf, ncap);
	s->str.buf = nbuf;
	return 0;
}

int sd_memcat(str_t *dst, const void *src, size_t len) {
	size_t nlen;
	nlen = sd_len(dst) + len;
	if (nlen >= sd_cap(dst) && _sd_realloc(dst, nlen) != 0)
		return -1;
	memcpy(sd_buf(dst) + sd_len(dst), src, len);
	sd_buf(dst)[nlen] = '\0';
	sd_setlen(dst, nlen);
	return 0;
}

int sd_printf(str_t *dst, const char *fmt, ...) {
	va_list ap;
	for (;;) {
		int n;
		size_t left;
		left = sd_cap(dst) - sd_len(dst);
		va_start(ap, fmt);
		n = vsnprintf(sd_buf(dst) + sd_len(dst), left, fmt, ap);
		va_end(ap);
		if (n < 0) {
			return -1;
		} else if ((size_t)(n) >= left) {
			if (_sd_realloc(dst, sd_len(dst) + n) != 0)
				return -1;
		} else {
			sd_setlen(dst, sd_len(dst) + n);
			sd_buf(dst)[sd_len(dst)] = '\0';
			break;
		}
	}
	return 0;
}
