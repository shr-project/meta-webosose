# Backport
# https://lists.yoctoproject.org/g/meta-virtualization/message/6014
FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch"
