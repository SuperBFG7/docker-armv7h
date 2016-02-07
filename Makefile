.PHONY: arch-rpi2 python2 sabnzbd samba sickrage2

all: python2 sabnzbd samba sickrage2

arch-rpi2:
	$(MAKE) -C arch-rpi2

python2:
	$(MAKE) -C python2

sabnzbd: arch-rpi2
	$(MAKE) -C sabnzbd

samba: arch-rpi2
	$(MAKE) -C samba

sickrage2: arch-rpi2
	$(MAKE) -C sickrage2
