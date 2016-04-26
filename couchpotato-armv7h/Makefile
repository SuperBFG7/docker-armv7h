all: couchpotato-armv7h

couchpotato-armv7h: build tag

force: force-build tag

build:
	sudo docker build -t superbfg7/couchpotato-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

force-build:
	sudo docker build -t superbfg7/couchpotato-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" --no-cache .

tag: build
	sudo docker tag superbfg7/couchpotato-armv7h superbfg7/couchpotato-armv7h:`date +%F`

create:
	sudo docker rename couchpotato couchpotato_old
	sudo docker create --name=couchpotato -v /etc/localtime:/etc/localtime:ro -v /opt/couchpotato:/config -v /data/video/new/sickrage/:/data -p 5050:5050 superbfg7/couchpotato-armv7h

restart:
	sudo docker stop couchpotato_old
	sudo docker start couchpotato

cleanup:
	sudo docker rm couchpotato_old

clean:
	sudo docker rm couchpotato
	sudo docker rmi superbfg7/couchpotato-armv7h

install:
	sudo cp -i couchpotato.service /etc/systemd/system/
	@echo systemctl enable couchpotato
	@echo systemctl start couchpotato
