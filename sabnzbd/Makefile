all: sabnzbd

sabnzbd:
	docker build -t superbfg7/sabnzbd \
		--build-arg "UID=`id -u sabnzbd`" \
		--build-arg "GID=`id -g sabnzbd`" .
