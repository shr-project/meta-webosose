# Copyright (c) 2025 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-Apply-an-upstream-patch-for-clang19-build.patch"
