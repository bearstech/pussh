default:

install:
	install -D -m755 pussh $(DESTDIR)/usr/bin/pussh
	install -D -m644 pussh.1 $(DESTDIR)/usr/share/man/man1/pussh.1
