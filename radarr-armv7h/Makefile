all: radarr-armv7h

radarr-armv7h: build tag

force: force-build tag

build:
	sudo docker build \
		-t superbfg7/radarr-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

force-build:
	sudo docker build --no-cache \
		-t superbfg7/radarr-armv7h \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

tag: build
	sudo docker tag superbfg7/radarr-armv7h superbfg7/radarr-armv7h:`date +%F`

create:
	sudo docker rename radarr radarr_old
	sudo docker create --name=radarr \
		-v /etc/localtime:/etc/localtime:ro \
		-v /opt/radarr/:/config \
		-v /data/video/sickrage/:/data \
		-p 7878:7878\
		superbfg7/radarr-armv7h

restart:
	sudo docker stop radarr_old
	sudo docker start radarr

cleanup:
	sudo docker rm radarr_old

clean:
	sudo docker rm radarr
	sudo docker rmi superbfg7/radarr-armv7h

install:
	sudo cp -i radarr.service /etc/systemd/system/
	@echo systemctl enable radarr
	@echo systemctl start radarr
