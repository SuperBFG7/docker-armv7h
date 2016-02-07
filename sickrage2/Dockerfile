FROM superbfg7/python2

ARG UID
ARG GID

RUN pacman -S --noconfirm git python2-mako python2-cheetah && \
		git clone https://github.com/SickRage/SickRage.git /app/sickrage && \
		rm -rf /app/sickrage/.git/ && \
		pacman -R --noconfirm git && \
		chown -R $UID:$GID /app

USER $UID

# Volumes and Ports
VOLUME /config /downloads /tv
EXPOSE 8081

CMD ["/app/sickrage/SickBeard.py","--datadir","/config"]
