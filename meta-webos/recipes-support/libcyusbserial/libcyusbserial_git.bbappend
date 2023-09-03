# Backport changes from
# https://lists.openembedded.org/g/openembedded-devel/message/104698

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch"
