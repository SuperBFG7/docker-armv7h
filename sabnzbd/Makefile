all: sabnzbd

sabnzbd:
	docker build -t superbfg7/sabnzbd \
		--build-arg "UID=`id -u sickrage`" \
		--build-arg "GID=`id -g sickrage`" .
