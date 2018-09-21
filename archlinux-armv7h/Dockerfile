FROM scratch

#ADD http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz /
ADD ArchLinuxARM-rpi-2-latest.tar.gz /
COPY mirrorlist /etc/pacman.d/mirrorlist
COPY locale.nopurge /etc/locale.nopurge
COPY pacmaster.sh /usr/local/bin/
COPY apacman* /
RUN pacman-key --init && \
	pacman-key --populate archlinuxarm && \
	pacman -R --noconfirm \
		raspberrypi-firmware raspberrypi-bootloader raspberrypi-bootloader-x \
		cryptsetup dhcpcd diffutils haveged inetutils iproute2 iptables \
		iputils jfsutils linux-firmware linux-raspberrypi logrotate lvm2 \
		man-db man-pages mdadm nano net-tools netctl reiserfsprogs s-nail \
		systemd systemd-sysvcompat xfsprogs libusb usbutils device-mapper \
		groff dbus kbd libpipeline libseccomp openresolv popt \
		thin-provisioning-tools libaio libelf file gawk openssh pciutils \
		procps-ng psmisc licenses tar util-linux hwids kmod ldns libedit \
		mpfr dnssec-anchors which sysfsutils gettext vi crda \
		wpa_supplicant grep gzip less sed texinfo wireless_tools mkinitcpio \
		libpcap dialog iw mkinitcpio-busybox wireless-regdb libnftnl libnl \
		libmnl && \
	pacman -Syu --noconfirm pwgen && \
	pacman -U --noconfirm /apacman* && \
	rm -f /apacman* && \
	apacman -S --noconfirm localepurge && \
	pwgen -s -1 16 | (read i; echo "$i"; echo "$i") | passwd && \
	userdel -f -r alarm && \
	pacmaster.sh -R packer pwgen && \
	pacmaster.sh -Syu

CMD ["/usr/local/bin/pacmaster.sh","-Syu"]
