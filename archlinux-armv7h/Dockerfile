FROM scratch

#ADD http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz /
ADD ArchLinuxARM-rpi-2-latest.tar.gz /
COPY mirrorlist /etc/pacman.d/mirrorlist
COPY locale.nopurge /etc/locale.nopurge
COPY pacmaster.sh /usr/local/bin/
RUN pacman -R --noconfirm \
		raspberrypi-firmware raspberrypi-firmware-bootloader \
		raspberrypi-firmware-bootloader-x raspberrypi-firmware-examples \
		raspberrypi-firmware-tools \
		cryptsetup dhcpcd diffutils haveged inetutils iproute2 iptables \
		iputils jfsutils linux-firmware linux-raspberrypi logrotate lvm2 \
		man-db man-pages mdadm nano net-tools netctl reiserfsprogs s-nail \
		systemd systemd-sysvcompat xfsprogs libusb usbutils device-mapper \
		groff dbus kbd libpipeline libseccomp openresolv popt \
		thin-provisioning-tools libaio libdbus libelf file gawk openssh \
		pciutils procps-ng psmisc licenses tar util-linux hwids kmod ldns \
		libedit libsystemd mpfr dnssec-anchors lz4 which sysfsutils \
		gettext libunistring glib2 vi crda wpa_supplicant && \
	pacman -Syu --noconfirm pwgen packer && \
	packer -S --noconfirm localepurge && \
	pwgen -s -1 16 | (read i; echo "$i"; echo "$i") | passwd && \
	userdel -f -r alarm && \
	pacmaster.sh -R packer pwgen && \
	pacmaster.sh -Syu

CMD ["/usr/local/bin/pacmaster.sh","-Syu"]
