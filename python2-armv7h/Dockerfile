FROM superbfg7/archlinux-armv7h-minimal

RUN pacman -Sy --noconfirm && \
	pacman -S --noconfirm python2 && \
	/bin/yes | pacman -Scc && \
	localepurge && \
	rm -rf /usr/share/doc/ /usr/share/gtk-doc/ /usr/share/info /usr/share/man 
