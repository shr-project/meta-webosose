# Backport https://lists.yoctoproject.org/g/meta-virtualization/message/6021
# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our systemd
DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"

# Backport https://lists.yoctoproject.org/g/meta-virtualization/message/6022
FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-setup.py-respect-udevdir-variable.patch"
