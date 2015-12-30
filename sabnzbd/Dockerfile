FROM superbfg7/arch-rpi2-minimal

ARG UID
ARG GID

COPY python2-yenc-0.4.0-3-armv7h.pkg.tar.xz sabnzbd-0.7.20-2-any.pkg.tar.xz /tmp/
RUN pacman -S --noconfirm python2-pyopenssl && \
	pacman -U --noconfirm /tmp/*pkg.tar.xz && \
	rm /tmp/*pkg.tar.xz && \
	localepurge

USER $UID

# set volumes
VOLUME /config /downloads /incomplete-downloads

# expose ports
EXPOSE 8080 9090

CMD ["/opt/sabnzbd/SABnzbd.py","-l0","--config-file","/config","--server","0.0.0.0:8080"]

