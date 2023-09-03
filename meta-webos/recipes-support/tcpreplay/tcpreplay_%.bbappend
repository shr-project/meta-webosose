# Backport changes from:
# https://lists.openembedded.org/g/openembedded-devel/message/104700

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch"
