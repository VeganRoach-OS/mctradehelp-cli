EXEC=mctradehelp
PREFIX=/usr/local

VCFLAGS=--pkg mctradehelp

SDIR=src
XDIR=bin

SRCS=$(shell ls $(SDIR)/*.vala)
XPATH=$(XDIR)/$(EXEC)

all: executable

install: all
	install -D -m755 $(XPATH) $(DESTDIR)$(PREFIX)/bin/$(EXEC)

executable: $(SRCS)
	mkdir -p $(XDIR)
	valac $(SRCS) -o $(XPATH) $(VCFLAGS)

clean:
	rm -rf $(XDIR)
