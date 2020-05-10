FROM superbfg7/archlinux-armv7h-minimal

ARG UID
ARG GID

RUN	pacmaster.sh -Syu gzip awk libmediainfo mono && \
		wget -O /NzbDrone.master.tar.gz https://download.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz && \
		tar xzfv NzbDrone.master.tar.gz && \
		pacmaster.sh -R binutils fakeroot file libsystemd pcre tar util-linux wget apacman mpfr awk gzip && \
		groupadd -r -o -g $GID sonarr && \
		useradd -r -o -u $UID -g sonarr -s /bin/false sonarr && \
		rm -f /NzbDrone.master.tar.gz

USER $UID

# Volumes and Ports
VOLUME /config /data
EXPOSE 8989

CMD ["/usr/bin/mono", "/NzbDrone/NzbDrone.exe", "-nobrowser", "-data=/config"]
