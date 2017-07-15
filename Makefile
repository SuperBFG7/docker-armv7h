.PHONY: archlinux-armv7h python2-armv7h nzbget-armv7h samba-armv7h sickrage2-armv7h couchpotato-armv7h
BASE = archlinux-armv7h
PYTHON2 = python2-armv7h
RESTART_MODULES = $(PYTHON2_MODULES)
PYTHON2_MODULES = nzbget-armv7h samba-armv7h sickrage2-armv7h couchpotato-armv7h
MODULES = $(BASE) $(PYTHON2) $(PYTHON2_MODULES)
PUSH_MODULES = $(BASE)-minimal $(PYTHON2) $(PYTHON2_MODULES)

DOCKER_USER = superbfg7

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

push:
	sudo docker login -u $(DOCKER_USER)
	for i in $(PUSH_MODULES); do \
		echo "----- pushing $$i"; \
		sudo docker push $(DOCKER_USER)/$$i; \
	done
