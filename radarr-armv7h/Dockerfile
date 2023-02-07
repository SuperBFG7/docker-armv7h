FROM superbfg7/mono-armv7h

ARG UID
ARG GID

RUN	pacmaster.sh -Syu && \
		wget -O /radarr.tar.gz $( wget -O - https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 ) && \
		tar xzfv radarr.tar.gz && \
		groupadd -r -o -g $GID radarr && \
		useradd -r -o -u $UID -g radarr -s /bin/false radarr && \
		chown -R radarr.radarr /Radarr && \
		rm -f /radarr.tar.gz

USER $UID

# Volumes and Ports
VOLUME /config /data
EXPOSE 7878

CMD ["/usr/bin/mono", "/Radarr/Radarr.exe", "-nobrowser", "-data=/config"]
