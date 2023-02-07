all: mono-armv7h

mono-armv7h:
	sudo docker build -t superbfg7/mono-armv7h .
	sudo docker tag superbfg7/mono-armv7h superbfg7/mono-armv7h:`/usr/bin/pacman -Si mono | grep Version | sed -e "s/.* //"`
