FROM superbfg7/archlinux-armv7h-minimal

ARG SERVER

ADD *.sh /

RUN echo -e "[custom]\n\
Server = http://$SERVER" >> /etc/pacman.conf && \
		pacmaster.sh -Syu php php-fpm php-gd php-imagick nginx \
		mariadb git expect imagemagick && \
		git clone https://github.com/electerious/Lychee.git /srv/http && \
		rm -rf /srv/http/uploads /srv/http/data && \
		ln -s /fotos/data /srv/http/data && \
		ln -s /fotos/uploads /srv/http/uploads && \
		pacmaster.sh -R git

# add config file
COPY nginx.conf /etc/nginx/nginx.conf

VOLUME /fotos
EXPOSE 80

CMD ["/lychee.sh"]
