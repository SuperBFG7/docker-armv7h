FROM scratch

#ADD http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz /
ADD ArchLinuxARM-rpi-2-latest.tar.gz /
COPY mirrorlist /etc/pacman.d/mirrorlist
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
		gettext libunistring glib2 vi && \
	pacman -Syu --noconfirm && \
	pacman -S --noconfirm packer && \
	packer -S --noconfirm localepurge && \
	pacman -R --noconfirm packer && \
	pacman -Scc	--noconfirm

ADD locale.nopurge /etc/locale.nopurge
RUN localepurge && \
	rm -rf /usr/share/doc/ /usr/share/gtk-doc/ /usr/share/info /usr/share/man 

CMD ["/bin/bash"]
