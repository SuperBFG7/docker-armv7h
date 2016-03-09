FROM superbfg7/python2-armv7h

RUN pacman -Sy --noconfirm && \
	pacman -S --noconfirm samba && \
	pacman -Scc	--noconfirm && \
	localepurge && \
	rm -rf /usr/share/doc/ /usr/share/gtk-doc/ /usr/share/info /usr/share/man 

# add config file
COPY smb.conf /etc/samba/smb.conf

# set volumes
VOLUME /music /log

# expose ports
EXPOSE 139 445

CMD ["/usr/bin/smbd","-F"]
