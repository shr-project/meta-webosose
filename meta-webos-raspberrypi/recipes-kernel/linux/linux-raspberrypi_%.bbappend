# Copyright (c) 2017-2022 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosrpi31"

CMDLINE:append = " rw cgroup_memory=1 cgroup_enable=memory swapaccount=1"
CMDLINE:remove:sota = "root=/dev/mmcblk0p2 rootfstype=ext4 rootwait rw"

SHRT_VER = "${@oe.utils.trim_version('${PV}', 2)}"
FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-${SHRT_VER}:${THISDIR}/${BPN}:"

SRC_URI += "\
    file://ostree.cfg \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'file://docker.cfg', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'file://ebtables.cfg', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'file://lxc.cfg', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'file://vswitch.cfg', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'file://xt-checksum.cfg', '', d)} \
    file://bridge.cfg \
    file://gps.cfg \
    file://usb-serial-ftdi-sio.cfg \
    file://oomd.cfg \
    file://ebpf.cfg \
"

KERNEL_MODULE_AUTOLOAD:append = " \
    i2c-dev \
    spidev \
    spi_bcm2835 \
    media \
    snd-usb-audio \
    uinput \
    uvcvideo \
    videodev \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'nf_conntrack_ipv6', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'openvswitch', '', d)} \
    bridge \
"

do_deploy:append() {
    # Remove kernel image link in meta-webos/classes/kernel.bbclass
    # However the image link is required in raspberrypi
    ln -sf ${type}-${KERNEL_IMAGE_NAME}.bin ${DEPLOYDIR}/${type}-${KERNEL_IMAGE_LINK_NAME}.bin
}
