.PHONY: archlinux-armv7h python2-armv7h nzbget-armv7h samba-armv7h sickrage2-armv7h couchpotato-armv7h
BASE = archlinux-armv7h
PYTHON2 = python2-armv7h
RESTART_MODULES = $(PYTHON2_MODULES)
PYTHON2_MODULES = nzbget-armv7h samba-armv7h sickrage2-armv7h couchpotato-armv7h
MODULES = $(BASE) $(PYTHON2) $(PYTHON2_MODULES)

all: $(MODULES)

restart:
	for i in $(RESTART_MODULES); do \
		$(MAKE) -C $$i create restart cleanup; \
	done 

$(BASE):
	$(MAKE) -C $@ clean all

$(PYTHON2): $(BASE)
	$(MAKE) -C $@

$(PYTHON2_MODULES): $(PYTHON2)
	$(MAKE) -C $@
