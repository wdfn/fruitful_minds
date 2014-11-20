#ifndef BASE64_H
#define BASE64_H

#include <stddef.h>

#define B64_ELEN(n)  ((((n) + 2) / 3) << 2)
#define B64_DLEN(n)  ((((n) + 3) >> 2) * 3)

extern size_t base64_encode(const char *, size_t, char *);
extern size_t base64_decode(const char *, size_t, char *);

#endif /* BASE64_H */
