#ifndef STDLOG_H
#define STDLOG_H

#include <stddef.h>

extern int stdlog_fopen(const char *, const char *);
extern int stdlog_close(void);
extern void stdlog(const char *, ...);
extern void stdlog_write(const char *, size_t);
extern void stdlog_cgi(void);

#endif /* STDLOG_H */
