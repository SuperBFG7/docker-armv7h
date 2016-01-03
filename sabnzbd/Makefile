all: sabnzbd

sabnzbd: darkhttpd.pid
	docker build -t superbfg7/sabnzbd \
		--build-arg "UID=`id -u sickrage`" \
		--build-arg "GID=`id -g sickrage`" \
		--build-arg "SERVER=`hostname -i | cut -f 1 -d ' '`" .
	cat darkhttpd.pid | xargs kill
	rm -f darkhttpd.pid

darkhttpd.pid:
	darkhttpd /packages/ & echo "$$!" > darkhttpd.pid
