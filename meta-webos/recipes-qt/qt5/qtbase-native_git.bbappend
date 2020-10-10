# Copyright (c) 2017-2019 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos3"

QT_CONFIG_FLAGS_remove = "-no-gui -no-libpng"
QT_CONFIG_FLAGS_append = " -no-widgets -evdev"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://0001-Do-not-ignore-exit-codes-of-install-commands.patch \
    file://0002-Do-not-ignore-exit-codes-when-installing-meta-files.patch \
"
