FROM superbfg7/python2-armv7h

ARG UID
ARG GID

RUN pacmaster.sh -Syu git python2-mako python2-cheetah && \
		git clone https://github.com/SickRage/SickRage.git /app/sickrage && \
		rm -rf /app/sickrage/.git/ && \
		pacmaster.sh -R git && \
		groupadd -r -o -g $GID sickrage && \
		useradd -r -u $UID -g sickrage -s /bin/false sickrage && \
		ln -s /data/downloads/complete/ /downloads && \
		ln -s /data/tv/ /tv && \
		chown -R $UID:$GID /app

USER $UID

# Volumes and Ports
VOLUME /config /data
EXPOSE 8081

CMD ["/app/sickrage/SickBeard.py","--datadir","/config"]
