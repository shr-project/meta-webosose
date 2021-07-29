# Copyright (c) 2021 LG Electronics, Inc.

EXTENDPRAUTO:append:rpi = "webosrpi1"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

PACKAGECONFIG:append:rpi = " dmabuf-client-buffer"

# Upstream-Status: Inappropriate
SRC_URI:append:rpi = " \
    file://0001-Fix-build-error-when-finding-libdrm.patch \
"
