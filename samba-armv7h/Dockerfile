FROM superbfg7/python2-armv7h

RUN pacmaster.sh -Syu samba

# add config file
COPY smb.conf /etc/samba/smb.conf

# set volumes
VOLUME /music /log

# expose ports
EXPOSE 139 445

CMD exec ionice -c 3 smbd -FS < /dev/null
