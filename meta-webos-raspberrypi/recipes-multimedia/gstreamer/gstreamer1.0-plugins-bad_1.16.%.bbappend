# Copyright (c) 2018-2021 LG Electronics, Inc.

EXTENDPRAUTO:append:rpi = "webosrpi5"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

DEPENDS:append:rpi = " webos-wayland-extensions"

PACKAGECONFIG:append:rpi = " kms wayland"

PACKAGECONFIG:remove:rpi = "faad"

SRC_URI:append:rpi = " \
    file://0001-waylandsink-remove-unsupported-subcompositor.patch \
    file://0002-waylandsink-zero-copy-using-wl-drm-protocol.patch \
    file://0003-fix-crash-in-wldrmallocator-for-64bit-porting-of-rpi4.patch \
"
