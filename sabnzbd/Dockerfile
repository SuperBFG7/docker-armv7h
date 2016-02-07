FROM superbfg7/python2

ARG UID
ARG GID
ARG SERVER

RUN echo -e "[custom]\n\
Server = http://$SERVER" >> /etc/pacman.conf && \
	pacman -Sy --noconfirm && \
	pacman -S --noconfirm python2-pyopenssl sabnzbd

USER $UID

# set volumes
VOLUME /config /downloads /incomplete-downloads

# expose ports
EXPOSE 8080 9090

CMD ["/opt/sabnzbd/SABnzbd.py","-l0","--config-file","/config","--server","0.0.0.0:8080"]

