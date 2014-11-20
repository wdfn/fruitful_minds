#ifndef FORM_H
#define FORM_H

#include <stddef.h>
#include "adt.h"

extern int query_decode(const char *, size_t, htb_t *);
/*
extern str_t *multipart_boundary(const char *, size_t);
extern int multipart_decode(const char *, size_t,
                            const char *, size_t, htb_t *);
*/

#endif /* FORM_H */
