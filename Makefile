.PHONY: arch-rpi2 sabnzbd sickrage2

all: sabnzbd sickrage2

arch-rpi2:
	$(MAKE) -C arch-rpi2

sabnzbd: arch-rpi2
	$(MAKE) -C sabnzbd

sickrage2: arch-rpi2
	$(MAKE) -C sickrage2
