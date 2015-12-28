FROM superbfg7/arch-rpi2-minimal

ARG UID
ARG GID

COPY python2-yenc.tar.xz sabnzbd.tar.xz /tmp/
RUN pacman -S --noconfirm python2-pyopenssl && \
	pacman --noconfirm -U /tmp/*.tar.xz && rm /tmp/*tar.xz

USER $UID

# set volumes
VOLUME /config /downloads /incomplete-downloads

# expose ports
EXPOSE 8080 9090

CMD ["/opt/sabnzbd/SABnzbd.py","-l0","--config-file","/config","--server","0.0.0.0:8080"]

