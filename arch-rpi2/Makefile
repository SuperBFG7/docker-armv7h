all: minimal

arch-rpi2:
	docker build -t superbfg7/arch-rpi2 .

export: arch-rpi2
	docker create --name=arch-rpi2-base superbfg7/arch-rpi2
	docker export arch-rpi2-base > arch-rpi2-minimal.tar
	gzip arch-rpi2-minimal.tar

minimal: export
	docker import arch-rpi2-minimal.tar.gz superbfg7/arch-rpi2-minimal

clean:
	docker rm arch-rpi2-base
