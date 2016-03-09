all: sickrage2-armv7h

sickrage2-armv7h: build tag

force: force-build tag

build:
	sudo docker build -t superbfg7/sickrage2-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

force-build:
	sudo docker build -t superbfg7/sickrage2-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" --no-cache .

tag: build
	sudo docker tag superbfg7/sickrage2-armv7h superbfg7/sickrage2-armv7h:`date +%F`

create:
	sudo docker rename sickrage2 sickrage2_old
	sudo docker create --name=sickrage2 -v /etc/localtime:/etc/localtime:ro -v /opt/sickrage/:/config -v /data/video/new/sickrage/:/data -p 8081:8081 superbfg7/sickrage2-armv7h

restart:
	sudo docker stop sickrage2_old
	sudo docker start sickrage2

cleanup:
	sudo docker rm sickrage2_old

clean:
	sudo docker rm sickrage2
	sudo docker rmi superbfg7/sickrage2-armv7h

install:
	sudo cp -i sickrage2.service /etc/systemd/system/
	@echo systemctl enable sickrage2
	@echo systemctl start sickrage2
