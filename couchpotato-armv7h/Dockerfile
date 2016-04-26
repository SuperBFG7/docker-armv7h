FROM superbfg7/python2-armv7h

ARG UID
ARG GID

ENV PYTHONIOENCODING="UTF-8"

RUN pacmaster.sh -Syu git python2-lxml python2-pyopenssl && \
		git clone https://github.com/CouchPotato/CouchPotatoServer.git /app/couchpotato && \
		rm -rf /app/couchpotato/.git/ && \
		pacmaster.sh -R git && \
		groupadd -r -g $GID couchpotato && \
		useradd -r -u $UID -g couchpotato -s /bin/false couchpotato && \
		ln -s /data/downloads/complete/ /downloads && \
		ln -s /data/movies/ /movies && \
		chown -R $UID:$GID /app

USER $UID

# Volumes and Ports
VOLUME /config /data
EXPOSE 5050

CMD ["python2", "/app/couchpotato/CouchPotato.py", "--config_file=/config/config.ini", "--data_dir=/config/data"]
