.PHONY: archlinux-armv7h nzbget-armv7h samba-armv7h
BASE = archlinux-armv7h
MONO = mono-armv7h
BUILD_MODULES = $(BASE) $(MONO) $(MODULES)
RESTART_MODULES = $(MODULES)
MODULES = $(BASE_MODULES) $(MONO_MODULES)
MONO_MODULES = nzbget-armv7h samba-armv7h
BASE_MODULES = radarr-armv7h sonarr-armv7h
PUSH_MODULES = $(BASE)-minimal $(MONO) $(MODULES)

DOCKER_USER = superbfg7

all: $(BUILD_MODULES)

clean:
	$(MAKE) -C archlinux-armv7h clean

restart:
	for i in $(RESTART_MODULES); do \
		$(MAKE) -C $$i create restart cleanup; \
	done 

$(BASE):
	$(MAKE) -C $@

$(MONO): $(BASE)
	$(MAKE) -C $@

$(BASE_MODULES): $(BASE)
	$(MAKE) -C $@

$(MONO_MODULES): $(MONO)
	$(MAKE) -C $@

push:
	sudo docker login -u $(DOCKER_USER)
	for i in $(PUSH_MODULES); do \
		echo "----- pushing $$i"; \
		sudo docker push $(DOCKER_USER)/$$i; \
	done
