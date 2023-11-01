# Copyright (c) 2023 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Upstream-Status: Backport
SRC_URI:append = " \
    file://0001-Remove-protobuf-logging.h-include.patch;maxver=6.5.2 \
    file://0002-Fix-include-of-std-set.patch;maxver=6.5.3 \
    file://0003-Remove-call-to-protobuf-FileDescriptor-syntax.patch;maxver=6.5.3 \
"
