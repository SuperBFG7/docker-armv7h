all: sickrage2

sickrage2:
	docker build -t superbfg7/sickrage2 \
		--build-arg "UID=`id -u sickrage`" \
		--build-arg "GID=`id -g sickrage`" .

install:
	sudo cp -i sickrage2.service /etc/systemd/system/
	echo systemctl enable sickrage2
	echo systemctl start sickrage2
