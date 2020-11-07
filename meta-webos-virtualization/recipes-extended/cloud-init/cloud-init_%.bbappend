# Backport https://lists.yoctoproject.org/g/meta-virtualization/message/6021
# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our systemd
DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
