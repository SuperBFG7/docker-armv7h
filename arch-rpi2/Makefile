all: arch-rpi2-minimal.tar.gz

ArchLinuxARM-rpi-2-latest.tar.gz:
	wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz
	docker build --no-cache -t superbfg7/arch-rpi2 .
	docker create --name=arch-rpi2-base superbfg7/arch-rpi2

arch-rpi2-minimal.tar.gz: ArchLinuxARM-rpi-2-latest.tar.gz
	docker start arch-rpi2-base
	docker export arch-rpi2-base > arch-rpi2-minimal.tar
	docker import arch-rpi2-minimal.tar superbfg7/arch-rpi2-minimal
	docker tag -f superbfg7/arch-rpi2-minimal superbfg7/arch-rpi2-minimal:`date +%F`
	gzip arch-rpi2-minimal.tar

clean:
	rm -f arch-rpi2-minimal.tar.gz

proper: clean
	docker rm arch-rpi2-base
