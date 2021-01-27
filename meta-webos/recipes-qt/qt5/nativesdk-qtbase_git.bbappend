# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos3"

# Use webOS as platform.
# Requires 9901-Add-webos-oe-g-and-webos-oe-clang-platforms.patch in qtbase.
XPLATFORM = "webos-oe-g++"
XPLATFORM_toolchain-clang = "webos-oe-clang"

# ${BPN} does not get "qtbase" for some reason
FILESEXTRAPATHS_prepend := "${THISDIR}/qtbase:"

# Upstream-Status: Inappropriate
SRC_URI_append = " \
    file://9901-Add-webos-oe-g-and-webos-oe-clang-platforms.patch \
"
