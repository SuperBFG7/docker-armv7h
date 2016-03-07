FROM superbfg7/arch-rpi2-minimal

RUN pacman -Sy --noconfirm && \
	pacman -S --noconfirm python2 && \
	pacman -Scc	--noconfirm && \
	localepurge && \
	rm -rf /usr/share/doc/ /usr/share/gtk-doc/ /usr/share/info /usr/share/man 
