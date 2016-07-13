all: lychee-armv7h

lychee-armv7h: build tag

force: force-build tag

build: darkhttpd.pid
	sudo docker build -t superbfg7/lychee-armv7h \
		--build-arg "SERVER=`hostname -i | cut -f 1 -d ' '`:8088" .
	cat darkhttpd.pid | xargs kill
	rm -f darkhttpd.pid

force-build: darkhttpd.pid
	sudo docker build -t superbfg7/lychee-armv7h --no-cache \
		--build-arg "SERVER=`hostname -i | cut -f 1 -d ' '`:8088" --no-cache .
	cat darkhttpd.pid | xargs kill
	rm -f darkhttpd.pid

darkhttpd.pid:
	darkhttpd /home/packages/ --port 8088 & echo "$$!" > darkhttpd.pid

tag: build
	sudo docker tag superbfg7/lychee-armv7h superbfg7/lychee-armv7h:`date +%F`

create:
	sudo docker rename lychee lychee_old
	sudo docker create --name=lychee -v /etc/localtime:/etc/localtime:ro -v /data/fotos/lychee:/fotos -p 80:80 superbfg7/lychee-armv7h

restart:
	sudo docker stop lychee_old
	sudo docker start lychee

cleanup:
	sudo docker rm lychee_old

clean:
	sudo docker rm lychee
	sudo docker rmi superbfg7/lychee-armv7h

install:
	sudo cp -i lychee.service /etc/systemd/system/
	@echo systemctl enable lychee
	@echo systemctl start lychee
