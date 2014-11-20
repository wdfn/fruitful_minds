#ifndef ADT_H
#define ADT_H

#include <stddef.h>

typedef struct _stdstr str_t;

struct _stdstr {
	size_t len;
	union _strmem {
		str_t *buf;
		char *ptr;
		char mem[1];
	} str;
};

extern const str_t strnul;

#define sa_alloc(n)		malloc(sizeof(size_t) + (n))
#define sa_free(s)		free(s)
#define sa_len(s)		((s)->len)
#define sa_str(s)		((s)->str.mem)
#define sa_setlen(s,n)	((s)->len = (n))

#define sp_alloc()		malloc(sizeof(size_t) + sizeof(char *))
#define sp_free(s)		free(s)
#define sp_len(s)		((s)->len)
#define sp_ptr(s)		((s)->str.ptr)
#define sp_setlen(s,n)	((s)->len = (n))
#define sp_setptr(s,p)	((s)->str.ptr = (p))

#define sd_len(s)		((s)->len)
#define sd_cap(s)		((s)->str.buf->len)
#define sd_buf(s)		((s)->str.buf->str.mem)

extern int sd_alloc(str_t *, size_t);
extern void sd_free(str_t *);
extern int sd_memcat(str_t *, const void *, size_t);
extern int sd_printf(str_t *, const char *, ...);
#define sd_litcat(s,l)	sd_memcat(s,l,(sizeof(l) - 1))


typedef struct _htbl {
	unsigned int size;
	unsigned int load;
	struct _ht_node **tbl;
	void (*dtor)(void *); 
} htb_t;

extern int ht_alloc(htb_t *, unsigned int);
extern void ht_free(htb_t *); 
extern void ht_dtor(htb_t *, void (*)(void *));
extern int ht_add(htb_t *, const void *, size_t, void *); 
extern void *ht_get(htb_t *, const void *, size_t);
extern void ht_clear(htb_t *);
#define ht_adds(m,s,v)	ht_add(m,s,(sizeof(s) - 1),v)
#define ht_gets(m,s)	ht_get(m,s,(sizeof(s) - 1))

#endif /* ADT_H */
