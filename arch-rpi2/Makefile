all: minimal

arch-rpi2: ArchLinuxARM-rpi-2-latest.tar.gz
	docker build -t superbfg7/arch-rpi2 .

ArchLinuxARM-rpi-2-latest.tar.gz:
	wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz

export: arch-rpi2
	docker create --name=arch-rpi2-base superbfg7/arch-rpi2
	docker export arch-rpi2-base > arch-rpi2-minimal.tar
	gzip arch-rpi2-minimal.tar

minimal: export
	docker import arch-rpi2-minimal.tar.gz superbfg7/arch-rpi2-minimal

clean:
	docker rm arch-rpi2-base
	rm -f arch-rpi2-minimal.tar.gz
