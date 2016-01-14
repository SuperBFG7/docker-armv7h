all: arch-rpi2-minimal.tar.gz

ArchLinuxARM-rpi-2-latest.tar.gz:
	wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz

arch-rpi2-minimal.tar.gz: ArchLinuxARM-rpi-2-latest.tar.gz
	docker build -t superbfg7/arch-rpi2 .
	docker create --name=arch-rpi2-base superbfg7/arch-rpi2
	docker export arch-rpi2-base > arch-rpi2-minimal.tar
	docker import arch-rpi2-minimal.tar superbfg7/arch-rpi2-minimal
	gzip arch-rpi2-minimal.tar

clean:
	rm -f arch-rpi2-minimal.tar.gz
	docker rm arch-rpi2-base
