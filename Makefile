PREFIX = /usr/local

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f bookmarksman $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/bookmarksman

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/bookmarksman
