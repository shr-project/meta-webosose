# Copyright (c) 2017-2023 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos2"

PACKAGECONFIG:append = " snappy"

# Needed for db8-native
BBCLASSEXTEND = "native"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-Revert-Disable-exceptions-and-RTTI-in-CMake-configur.patch"
