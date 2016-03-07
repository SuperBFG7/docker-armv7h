all: python2-armv7h

python2-armv7h:
	sudo docker build -t superbfg7/python2-armv7h .
	sudo docker tag superbfg7/python2-armv7h superbfg7/python2-armv7h:`/usr/bin/pacman -Sp --print-format %v python2`
