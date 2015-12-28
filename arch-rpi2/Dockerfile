FROM scratch

ADD ArchLinuxARM-rpi-2-latest.tar.gz /
RUN pacman -Sy --noconfirm && \
	pacman -R --noconfirm raspberrypi-firmware raspberrypi-firmware-bootloader raspberrypi-firmware-bootloader-x raspberrypi-firmware-examples raspberrypi-firmware-tools && \
	pacman -R --noconfirm cryptsetup dhcpcd diffutils haveged inetutils iproute2 iptables iputils jfsutils linux-firmware linux-raspberrypi logrotate lvm2 man-db man-pages mdadm nano net-tools netctl reiserfsprogs s-nail sed systemd systemd-sysvcompat xfsprogs libusb usbutils device-mapper groff && \
	pacman -R --noconfirm dbus kbd libpipeline libseccomp openresolv popt thin-provisioning-tools libaio libdbus libelf file gawk openssh pciutils procps-ng psmisc licenses tar util-linux hwids kmod ldns libedit libsystemd mpfr dnssec-anchors lz4 which sysfsutils grep gettext libunistring glib2

CMD ["/bin/bash"]
