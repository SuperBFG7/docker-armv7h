all: python2

python2:
	sudo docker build -t superbfg7/python2 .
	sudo docker tag -f superbfg7/python2 superbfg7/python2:`/usr/bin/pacman -Sp --print-format %v python2`
