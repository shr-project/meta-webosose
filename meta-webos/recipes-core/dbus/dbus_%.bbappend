# Copyright (c) 2014-2017 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos5"

PACKAGES =+ "${PN}-gpl"
LICENSE += "& GPL-2.0"
LICENSE_${PN}-gpl = "GPL-2.0"

RDEPENDS_${PN} += "${PN}-gpl"

FILES_${PN}-gpl = " \
    ${bindir}/dbus-cleanup-sockets \
    ${bindir}/dbus-daemon \
    ${bindir}/dbus-monitor \
    ${bindir}/dbus-send \
    ${bindir}/dbus-uuidgen \
"
