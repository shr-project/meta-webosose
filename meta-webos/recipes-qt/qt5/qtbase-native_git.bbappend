# Copyright (c) 2017-2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos6"

# Use webOS as platform.
# Requires 9901-Add-webos-oe-g-and-webos-oe-clang-platforms.patch in qtbase.
XPLATFORM = "webos-oe-g++"
XPLATFORM_toolchain-clang = "webos-oe-clang"

QT_CONFIG_FLAGS_remove = "-no-gui -no-libpng"
QT_CONFIG_FLAGS_append = " -no-widgets -evdev"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# Upstream-Status: Backport
SRC_URI_append = " \
    file://0001-Do-not-ignore-exit-codes-of-install-commands.patch \
    file://0002-Do-not-ignore-exit-codes-when-installing-meta-files.patch \
"

# Upstream-Status: Inappropriate
SRC_URI_append = " \
    file://9901-Add-webos-oe-g-and-webos-oe-clang-platforms.patch \
"
