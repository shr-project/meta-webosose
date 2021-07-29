# Copyright (c) 2017-2018 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos4"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += "\
    file://passwd.master \
    file://group.master \
"

do_configure:prepend () {
    cp -v ${WORKDIR}/passwd.master ${S}/
    cp -v ${WORKDIR}/group.master ${S}/
}
