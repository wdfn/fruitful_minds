#include <stddef.h>
#include <limits.h>

static inline char _enc(int i) {
/*	if ((unsigned int)i < 64)
		return '\0';
*/
#ifdef USE_BASE64_LUT
	static char table[64] = { /* Base64 to ASCII */
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
		'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
		'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
		'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
		'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
		'w', 'z', 'y', 'z', '0', '1', '2', '3',
		'4', '5', '6', '7', '8', '9', '+', '/'
	};
	return table[i];
#else
	return (i < 26) ? i + 65 : /* 'A' - 'Z' */
	       (i < 52) ? i + 71 : /* 'a' - 'z' */
		   (i < 62) ? i - 4  : /* '0' - '9' */
		   (i == 62) ? '\x2B' : /* '+' */
		               '\x2F';  /* '/' */
#endif /* USE_BASE64_LUT */
}

static inline int _dec(char c) {
#ifdef USE_BASE64_LUT
	static char table[0x80] = { /* ASCII to Base64 */
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
		52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
		-1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
		15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
		-1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
		41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1
	};
#if CHAR_BIT == 8
	return (c & 0x80) ? -1 : table[c];
#else
	return (c < 0x80) ? -1 : table[c];
#endif /* CHAR_BIT */

#else
	return ((unsigned char)(c - '\x41') < 26) ? c - 65 : /* 'A' - 'Z' */
	       ((unsigned char)(c - '\x61') < 26) ? c - 71 : /* 'a' - 'z' */
		   ((unsigned char)(c - '\x30') < 10) ? c + 4  : /* '0' - '9' */
		   (c == '\x2B') ? 62 : /* '+' */
		   (c == '\x2F') ? 63 : /* '/' */
		                   -1;
#endif /* USE_BASE64_LUT */
}

#if CHAR_BIT == 8

size_t base64_encode(const char *src, size_t len, char *dst) {
	const char *sp;
	char *buf;
	char s0, s1, s2;

	sp = src + (len - (len % 3));
	for (buf = dst; src < sp; src += 3, buf += 4) {
		s0 = src[0];
		s1 = src[1];
		s2 = src[2];
		buf[0] = _enc(s0 >> 2);
		buf[1] = _enc(((s0 << 4) & 0x30) | (s1 >> 4));
		buf[2] = _enc(((s1 << 2) & 0x3C) | (s2 >> 6));
		buf[3] = _enc(s2 & 0x3F);
	}
	/* Fringe case */
	switch (len % 3) {
		case 2:
			s0 = src[0];
			s1 = src[1];
			buf[0] = _enc(s0 >> 2);
			buf[1] = _enc(((s0 << 4) & 0x30) | (s1 >> 4));
			buf[2] = _enc((s1 << 2) & 0x3C);
			buf[3] = '\x3D'; /* '=' */
			buf += 4;
			break;
		case 1:
			s0 = src[0];
			buf[0] = _enc(s0 >> 2);
			buf[1] = _enc((s0 << 4) & 0x30);
			buf[2] = '\x3D'; /* '=' */
			buf[3] = '\x3D'; /* '=' */
			buf += 4;
			break;
	}
	return (buf - dst);
}

size_t base64_decode(const char *src, size_t len, char *dst) {
	const char *sp;
	char *buf;
	char s0, s1, s2, s3;

	/* Truncate padding if length is a multiple of 4 bytes */
	if (len > 0 && (len & 0x3) == 0 && src[len - 1] == '=')
		len -= (src[len - 2] == '=') ? 2 : 1;

	sp = src + (len & ~(0x3));
	for (buf = dst; src < sp; src += 4, buf += 3) {
		s0 = _dec(src[0]);
		s1 = _dec(src[1]);
		s2 = _dec(src[2]);
		s3 = _dec(src[3]);
		if (s0 < 0 || s1 < 0 || s2 < 0 || s3 < 0)
			return 0;
		buf[0] = (s0 << 2) | (s1 >> 4);
		buf[1] = (s1 << 4) | (s2 >> 2);
		buf[2] = (s2 << 6) | (s3);
	}
	/* Fringe case */
	switch (len & 0x3) {
		case 3:
			s0 = _dec(src[0]);
			s1 = _dec(src[1]);
			s2 = _dec(src[2]);
			if (s0 < 0 || s1 < 0 || s2 < 0 || (s2 & 0x3) != 0)
				return 0;
			buf[0] = (s0 << 2) | (s1 >> 4);
			buf[1] = (s1 << 4) | (s2 >> 2);
			buf += 2;
			break;
		case 2:
			s0 = _dec(src[0]);
			s1 = _dec(src[1]);
			if (s0 < 0 || s1 < 0 || (s1 & 0xF) != 0)
				return 0;
			buf[0] = (s0 << 2) | (s1 >> 4);
			buf++;
			break;
		case 1:
			return 0;
	}
	return (buf - dst);
}

#else
#error non-octal bytes unsupported
#endif /* CHAR_BIT */
