all: samba

samba:
	docker build -t superbfg7/samba .
	docker tag -f superbfg7/samba superbfg7/samba:`/usr/bin/pacman -Sp --print-format %v samba`

install:
	sudo cp -i samba.service /etc/systemd/system/
	echo systemctl enable samba
	echo systemctl start samba
