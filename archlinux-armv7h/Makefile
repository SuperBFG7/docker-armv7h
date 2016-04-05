all: archlinux-armv7h-minimal.tar.gz

ArchLinuxARM-rpi-2-latest.tar.gz:
	wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz
	sudo docker build --no-cache -t superbfg7/archlinux-armv7h .

archlinux-armv7h-minimal.tar.gz: ArchLinuxARM-rpi-2-latest.tar.gz
	sudo docker run --name=archlinux-armv7h-base superbfg7/archlinux-armv7h
	sudo docker export archlinux-armv7h-base > archlinux-armv7h-minimal.tar
	sudo docker import archlinux-armv7h-minimal.tar superbfg7/archlinux-armv7h-minimal
	sudo docker tag superbfg7/archlinux-armv7h-minimal superbfg7/archlinux-armv7h-minimal:`date +%F`
	gzip archlinux-armv7h-minimal.tar

clean:
	rm -f archlinux-armv7h-minimal.tar.gz
	sudo docker rm archlinux-armv7h-base

proper: clean
	rm -f ArchLinuxARM-rpi-2-latest.tar.gz
	sudo docker rmi superbfg7/archlinux-armv7h
