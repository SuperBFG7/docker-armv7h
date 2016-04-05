FROM superbfg7/python2-armv7h

ARG UID
ARG SERVER

RUN echo -e "[custom]\n\
Server = http://$SERVER" >> /etc/pacman.conf && \
	pacmaster.sh -Syu python2-pyopenssl sabnzbd && \
	ln -s /data/done/ /downloads && \
	ln -s /data/tmp/ /incomplete-downloads

USER $UID

# set volumes
VOLUME /config /data

# expose ports
EXPOSE 8080 9090

CMD ["/opt/sabnzbd/SABnzbd.py","-l0","--config-file","/config","--server","0.0.0.0:8080"]

