FROM scratch

#ADD http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz /
ADD ArchLinuxARM-rpi-2-latest.tar.gz /
COPY mirrorlist /etc/pacman.d/mirrorlist
COPY locale.nopurge /etc/locale.nopurge
COPY pacmaster.sh /usr/local/bin/
COPY apacman* /
RUN pacman-key --init && \
	pacman-key --populate archlinuxarm
RUN	pacman -R --noconfirm \
		raspberrypi-firmware raspberrypi-bootloader raspberrypi-bootloader-x \
		dhcpcd diffutils haveged inetutils iproute2 \
		iputils jfsutils linux-firmware linux-raspberrypi logrotate lvm2 \
		man-db man-pages mdadm nano net-tools netctl reiserfsprogs s-nail \
		systemd-sysvcompat xfsprogs usbutils \
		groff libpipeline openresolv \
		thin-provisioning-tools libaio file gawk openssh pciutils \
		procps-ng psmisc licenses tar ldns libedit \
		mpfr dnssec-anchors which sysfsutils gettext vi crda \
		wpa_supplicant grep gzip less sed texinfo wireless_tools mkinitcpio \
		dialog iw mkinitcpio-busybox wireless-regdb && \
	pacman -Syu --noconfirm pwgen && \
	pacman -U --noconfirm /apacman* && \
	rm -f /apacman* && \
	apacman -S --noconfirm localepurge && \
	pwgen -s -1 16 | (read i; echo "$i"; echo "$i") | passwd && \
	userdel -f -r alarm && \
	pacmaster.sh -R packer pwgen && \
	pacmaster.sh -Syu

CMD ["/usr/local/bin/pacmaster.sh","-Syu"]
