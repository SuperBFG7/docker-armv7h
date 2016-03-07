all: sickrage2-armv7h

sickrage2-armv7h:
	sudo docker build -t superbfg7/sickrage2-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .
	sudo docker tag superbfg7/sickrage2-armv7h superbfg7/sickrage2:`date +%F`

install:
	sudo cp -i sickrage2.service /etc/systemd/system/
	echo systemctl enable sickrage2
	echo systemctl start sickrage2
