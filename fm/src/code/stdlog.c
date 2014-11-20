#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <time.h>

#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>

static const char *app;
static pid_t pid;
static int logfd = -1;

int stdlog_fopen(const char *appname, const char *path) {
	logfd = open(path, O_WRONLY | O_APPEND | O_CREAT,
	             S_IRUSR | S_IWUSR);
	if (logfd < 0)
		return -1;
	pid = getpid();
	app = (appname != NULL ? appname : "");
	return 0;
}

int stdlog_close(void) {
	return ((close(logfd) == 0) ? (logfd = -1, 0) : -1);
}

static inline int _stdlog_prefix(void) {
	time_t now;
	struct tm dt;
	if (time(&now) == -1 || gmtime_r(&now, &dt) == NULL) {
		memset(&dt, 0x00, sizeof(struct tm));
		dt.tm_year = -1900;
		dt.tm_mon = -1;
	}
	/* <http://sourceware.org/bugzilla/show_bug.cgi?id=6771> */
	return dprintf(logfd, "%04d-%02d-%02dT%02d:%02d:%02dZ %s %d: ",
	               dt.tm_year + 1900, dt.tm_mon + 1, dt.tm_mday,
	               dt.tm_hour, dt.tm_min, dt.tm_sec, app, pid);
}

static inline int _stdlog_lock(void) {
	struct flock fl;
	fl.l_type = F_WRLCK;
	fl.l_whence = SEEK_SET;
	fl.l_start = 0;
	fl.l_len = 0;
	return fcntl(logfd, F_SETLKW, &fl);
}

static inline int _stdlog_unlock(void) {
	struct flock fl;
	fl.l_type = F_UNLCK;
	return fcntl(logfd, F_SETLK, &fl);
}

void stdlog(const char *fmt, ...) {
	va_list ap;
	if (logfd < 0 || _stdlog_lock() != 0)
		return;
	_stdlog_prefix();
	va_start(ap, fmt);
	vdprintf(logfd, fmt, ap);
	va_end(ap);
	_stdlog_unlock();
}

void stdlog_write(const char *str, size_t len) {
	if (logfd < 0 || _stdlog_lock() != 0)
		return;
	_stdlog_prefix();
	if (write(logfd, str, len) != (ssize_t)(len)
	    || (str[len - 1] != '\n'
	        && write(logfd, "\n", 1) != 1)) {
		/* no-op */
	}
	_stdlog_unlock();
}

void stdlog_cgi(void) {
	const char *method;
	const char *uri;
	const char *proto;
	const char *ipaddr;
	const char *agent;
	
	method = getenv("REQUEST_METHOD");
	uri    = getenv("REQUEST_URI");
	proto  = getenv("SERVER_PROTOCOL");
	ipaddr = getenv("REMOTE_ADDR");
	agent  = getenv("HTTP_USER_AGENT");
	stdlog("%s \"%s %s %s\" \"%s\"\n",
	       ipaddr != NULL ? ipaddr : "0.0.0.0",
	       method != NULL ? method : "?",
	       uri != NULL ? uri : "?",
	       proto != NULL ? proto : "HTTP/?",
	       agent != NULL ? agent : "");
}
