.PHONY: arch-rpi2 sabnzbd samba sickrage2

all: sabnzbd samba sickrage2

arch-rpi2:
	$(MAKE) -C arch-rpi2

sabnzbd: arch-rpi2
	$(MAKE) -C sabnzbd

samba: arch-rpi2
	$(MAKE) -C samba

sickrage2: arch-rpi2
	$(MAKE) -C sickrage2
