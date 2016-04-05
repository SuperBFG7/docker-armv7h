FROM superbfg7/python2-armv7h

ARG UID
ARG GID

RUN pacmaster.sh -Syu nzbget unrar unzip p7zip git && \
		mkdir /app/ && \
		git clone https://github.com/clinton-hall/nzbToMedia.git /app/nzbToMedia/ && \
		pacmaster.sh -R git && \
		groupadd -r -g $GID nzbget && \
		useradd -r -u $UID -g nzbget -s /bin/false nzbget && \
		chown -R $UID:$GID /app

USER $UID

# set volumes
VOLUME /config /downloads

# expose ports
EXPOSE 6789

CMD ["/usr/bin/nzbget","-s","-o","outputmode=log","-c","/config/nzbget.conf"]
