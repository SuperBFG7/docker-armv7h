FROM superbfg7/archlinux-armv7h-minimal

ARG UID
ARG GID

RUN pacmaster.sh -Syu nzbget unrar unzip p7zip git && \
		mkdir /app/ && \
		pacmaster.sh -R git && \
		groupadd -r -o -g $GID nzbget && \
		useradd -r -o -u $UID -g nzbget -s /bin/false nzbget && \
		chown -R $UID:$GID /app

USER $UID

# set volumes
VOLUME /config /downloads

# expose ports
EXPOSE 6789

CMD ["/usr/bin/nzbget","-s","-o","outputmode=log","-c","/config/nzbget.conf"]
