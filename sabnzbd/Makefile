all: sabnzbd

sabnzbd: darkhttpd.pid
	sudo docker build -t superbfg7/sabnzbd \
		--build-arg "UID=`id -u sickrage`" \
		--build-arg "GID=`id -g sickrage`" \
		--build-arg "SERVER=`hostname -i | cut -f 1 -d ' '`:8088" .
	sudo docker tag -f superbfg7/sabnzbd \
		superbfg7/sabnzbd:`/usr/bin/pacman -Sp --print-format %v sabnzbd`
	cat darkhttpd.pid | xargs kill
	rm -f darkhttpd.pid

darkhttpd.pid:
	darkhttpd /home/packages/ --port 8088 & echo "$$!" > darkhttpd.pid

install:
	sudo cp -i sabnzbd.service /etc/systemd/system/
	echo systemctl enable sabnzbd
	echo systemctl start sabnzbd
