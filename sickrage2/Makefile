all: sickrage2

sickrage2:
	docker build -t superbfg7/sickrage2 \
		--build-arg "UID=`id -u sickrage`" \
		--build-arg "GID=`id -g sickrage`" .
