# Copyright (c) 2013-2021 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO:append = "webos23"

# qtwayland-{plugins,qmlplugins} are not used in webOS
RRECOMMENDS:${PN}:remove = "${PN}-plugins ${PN}-qmlplugins"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
