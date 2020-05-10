all: sonarr-armv7h

sonarr-armv7h: build tag

force: force-build tag

build:
	sudo docker build \
		-t superbfg7/sonarr-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

force-build:
	sudo docker build --no-cache \
		-t superbfg7/sonarr-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

tag: build
	sudo docker tag superbfg7/sonarr-armv7h superbfg7/sonarr-armv7h:`date +%F`

create:
	sudo docker rename sonarr sonarr_old
	sudo docker create --name=sonarr \
		-v /etc/localtime:/etc/localtime:ro \
		-v /opt/sonarr/:/config \
		-v /data/video/sonarr/:/data \
		-p 8989:8989 \
		superbfg7/sonarr-armv7h

restart:
	sudo docker stop sonarr_old
	sudo docker start sonarr

cleanup:
	sudo docker rm sonarr_old

clean:
	sudo docker rm sonarr
	sudo docker rmi superbfg7/sonarr-armv7h

install:
	sudo cp -i sonarr.service /etc/systemd/system/
	@echo systemctl enable sonarr
	@echo systemctl start sonarr
