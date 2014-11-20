CC := gcc
M4 := m4

CFLAGS := -std=c99 -Wall -Wextra -pedantic -O2 -D _POSIX_C_SOURCE=200809L
LDFLAGS := -Wall

BUILD_DIR := obj
DIST_DIR := www

HTML_SRCDIR := src/template
HTML_SRCS := \
	index.m4 mission.m4 services.m4 team.m4 supporters.m4 donate.m4 contact.m4 \
	news.m4 students.m4 educators.m4 involved.m4 download/curriculum.m4 recipes.m4 \
	team/allyson-cesario.m4 team/sarah-french.m4 \
	team/kai-ouye.m4 team/teresa-tucker.m4 \
	team/paulina-altshuler.m4 team/connie-tien.m4 \
	team/eunice-lam.m4 team/lauren-mcavoy.m4 \
	symposium-2013.m4 symposium-2014.m4 \
	articles/decal.m4 \
	articles/the-health-of-a-college-student.m4 \
	articles/with-menu-labeling-laws.m4 \
	articles/eat-healthy-eat-smart.m4 \
	articles/heart-attack-grill.m4 \
	articles/free-radicals-and-antioxidants.m4 \
	articles/is-organic-produce-really-better.m4 \
	articles/dietary-fiber-and-its-health-benefits.m4 \
	extern/analyze-my-plate.m4 \
	extern/harvest-of-the-month.m4 \
	extern/farmers-markets-eastbay.m4 \
	extern/berkeley.m4
HTML_OBJS := $(HTML_SRCS:%.m4=%.html)
M4_FLAGS += -I $(HTML_SRCDIR)

ETC_SRCDIR := src/static

CODE_SRCDIR := src/code
INCLUDE := -I $(CODE_SRCDIR)

INCLUDE += -I $(CODE_SRCDIR)/adt
MAILER_SRCS := mailer.c smtp.c base64.c form.c stdlog.c adt/str.c adt/htb.c
MAILER_OBJS := $(MAILER_SRCS:%.c=%.o)

WWW_USER := fruitful
WWW_HOST := fruitfulminds.org
WWW_DIR := ~/public_html

.DEFAULT_GOAL := all

$(DIST_DIR)/%.html: $(HTML_SRCDIR)/%.m4
	@test -d $(@D) || mkdir -p $(@D)
	$(M4) $(M4_FLAGS) $< | sed 's/&apos;/\&#39;/g' > $@

$(BUILD_DIR)/%.o: $(CODE_SRCDIR)/%.c
	@test -d $(@D) || mkdir -p $(@D)
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ $<

.PHONY: html
html: $(HTML_OBJS:%=$(DIST_DIR)/%)

$(DIST_DIR)/mail.cgi: $(MAILER_OBJS:%=$(BUILD_DIR)/%)
	@test -d $(@D) || mkdir -p $(@D)
	$(CC) $(LDFLAGS) -o $@ $(MAILER_OBJS:%=$(BUILD_DIR)/%)

.PHONY: cgi
cgi: $(DIST_DIR)/mail.cgi

.PHONY: all
all: html cgi
	cp -Rp $(ETC_SRCDIR)/* $(DIST_DIR)

.PHONY: install-html
install-html: html
	cd $(DIST_DIR) && rsync -avzR -e ssh $(HTML_OBJS) $(WWW_USER)@$(WWW_HOST):$(WWW_DIR)

.PHONY: install
install: all
	@tar -cv -C $(DIST_DIR) . |\
	ssh -l $(WWW_USER) $(WWW_HOST) 'tar -x -C "$(WWW_DIR)"'

.PHONY: clean
clean:
	test -d $(BUILD_DIR) && rm -R $(BUILD_DIR) || true
	test -d $(DIST_DIR) && rm -R $(DIST_DIR) || true

.PHONY: git
git:
	@test -d www.git || git clone --bare . www.git
	git push www.git
	rsync -avz -e ssh --size-only www.git $(WWW_USER)@$(WWW_HOST):'$(WWW_DIR)/dev'
