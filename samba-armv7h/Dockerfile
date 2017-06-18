FROM superbfg7/python2-armv7h

RUN pacmaster.sh -Syu samba util-linux &&\
		mkdir -p /var/run/samba

# add config file
COPY smb.conf /etc/samba/smb.conf

# set volumes
VOLUME /music /upload /log

# expose ports
EXPOSE 139 445

CMD exec ionice -c 3 smbd -FS < /dev/null
