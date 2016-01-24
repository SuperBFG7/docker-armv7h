all: sabnzbd

sabnzbd: darkhttpd.pid
	docker build -t superbfg7/sabnzbd \
		--build-arg "UID=`id -u sickrage`" \
		--build-arg "GID=`id -g sickrage`" \
		--build-arg "SERVER=`hostname -i | cut -f 1 -d ' '`" .
	docker tag -f superbfg7/sabnzbd \
		superbfg7/sabnzbd:`/usr/bin/pacman -Sp --print-format %v sabnzbd`
	cat darkhttpd.pid | xargs kill
	rm -f darkhttpd.pid

darkhttpd.pid:
	darkhttpd /home/packages/ & echo "$$!" > darkhttpd.pid

install:
	sudo cp -i sabnzbd.service /etc/systemd/system/
	echo systemctl enable sabnzbd
	echo systemctl start sabnzbd
