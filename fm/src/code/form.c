#include <stdlib.h>
#include <string.h>

#include "adt.h"
#include "form.h"

static const char *strnchr(const char *s, int c, size_t n) {
	for (; n > 0; n--) {
		if (*s == (char)c)
			return s;
		s++;
	}
	return NULL;
}

static const char *memmem(const void *s1, size_t n1,
                          const void *s2, size_t n2) {
	const char *t1;
	for (t1 = s1; n1 >= n2; t1++, n1--) {
		if (memcmp(t1, s2, n2) == 0)
			return t1;
	}
	return NULL;
}

static inline int _htoi(int c) {
	return ((unsigned char)(c - '\x30') <= 0x09) ? c - 0x30 : /* '0' to '9' */
	       ((unsigned char)(c - '\x41') <= 0x05) ? c - 0x37 : /* 'A' to 'F' */
		   ((unsigned char)(c - '\x61') <= 0x05) ? c - 0x57 : /* 'a' to 'f' */
		   -1; /* Not a hexadecimal digit */
}

static size_t url_decode_len(const char *str, size_t len) {
	const char *end;
	const char *ptr;
	size_t n;
	end = str + len;
	for (n = 0, ptr = str; ptr < end;) {
		if (*ptr == '%') {
			if (end - ptr < 3)
				return 0;
			ptr += 3;
			n++;
		} else {
			ptr++;
		}
	}
	return (end - str) - (n << 1);
}

static int url_decode(const char *str, size_t len, char *buf) {
	const char *end;
	end = str + len;
	while (str < end) {
		switch (*str) {
			case '%': { /* percent-encoded character */
				int n1, n2;
				if (end - str < 3
				    || (n1 = _htoi(str[1])) < 0
				    || (n2 = _htoi(str[2])) < 0) {
					return -1;
				}
				*buf = (n1 << 4) | n2;
				str += 3;
				break;
			}
			case '+': /* space */
				*buf = ' ';
				str++;
				break;
			default: /* unreserved character */
				*buf = *str++;
		}
		buf++;
	}
	return 0;
}

int query_decode(const char *src, size_t len, htb_t *query) {
	if (ht_alloc(query, 32) != 0)
		return -1;
	ht_dtor(query, free);

	while (len > 0) {
		const char *end;
		str_t *val;
		size_t elen, dlen, nlen;

		/* Parse field name */
		end = strnchr(src, '=', len);
		if (end == NULL || (elen = end - src) == 0)
			goto error;
		dlen = url_decode_len(src, elen);
		char name[dlen];
		if (url_decode(src, elen, name) != 0)
			goto error;
		/* Advance past '=' */
		elen++;
		len -= elen;
		src += elen;
		nlen = dlen;

		/* Parse value */
		end = strnchr(src, '&', len);
		elen = (end != NULL) ? (size_t)(end - src) : len;
		dlen = url_decode_len(src, elen);
		val = sa_alloc(dlen + 1);
		if (val == NULL || url_decode(src, elen, sa_str(val)) != 0)
			goto error;
		sa_str(val)[dlen] = '\0';
		sa_setlen(val, dlen);
		if (ht_add(query, name, nlen, val) != 0) {
			sa_free(val);
			goto error;
		}

		if (end == NULL)
			break;
		/* Advance past '&' */
		elen++;
		len -= elen;
		src += elen;
	}
	return 0;
error:
	ht_free(query);
	return -1;
}
