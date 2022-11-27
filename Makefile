all: # nothing to build

install:
	mkdir -p $(DESTDIR)/usr/share/bloop-box
	cp -a share/* $(DESTDIR)/usr/share/bloop-box

