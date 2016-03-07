all: sabnzbd-armv7h

sabnzbd-armv7h: build tag

force: force-build tag

build: darkhttpd.pid
	sudo docker build -t superbfg7/sabnzbd-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "SERVER=`hostname -i | cut -f 1 -d ' '`:8088" .
	cat darkhttpd.pid | xargs kill
	rm -f darkhttpd.pid

force-build: darkhttpd.pid
	sudo docker build -t superbfg7/sabnzbd-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "SERVER=`hostname -i | cut -f 1 -d ' '`:8088" --no-cache .
	cat darkhttpd.pid | xargs kill
	rm -f darkhttpd.pid

darkhttpd.pid:
	darkhttpd /home/packages/ --port 8088 & echo "$$!" > darkhttpd.pid

tag: build
	sudo docker tag superbfg7/sabnzbd-armv7h \
		superbfg7/sabnzbd-armv7h:`/usr/bin/pacman -Si sabnzbd | grep Version | sed -e "s/.* //"`

create:
	sudo docker rename sabnzbd sabnzbd_old
	sudo docker create --name=sabnzbd -v /etc/localtime:/etc/localtime:ro -v /opt/sabnzbd/:/config -v /data/video/new/tv.incoming/:/data -p 8085:8080 superbfg7/sabnzbd-armv7h

restart:
	sudo docker stop sabnzbd_old
	sudo docker start sabnzbd

cleanup:
	sudo docker rm sabnzbd_old

clean:
	sudo docker rm sabnzbd
	sudo docker rmi superbfg7/sabnzbd-armv7h

install:
	sudo cp -i sabnzbd.service /etc/systemd/system/
	echo systemctl enable sabnzbd
	echo systemctl start sabnzbd
