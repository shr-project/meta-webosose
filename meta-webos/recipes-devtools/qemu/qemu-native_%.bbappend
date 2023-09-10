# Copyright (c) 2023 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI:append = " \
    file://0001-Revert-qemu-osdep-Remove-fallback-for-MAP_FIXED_NORE.patch \
    file://0002-syscall.c-add-MAP_SHARED_VALIDATE-fallback.patch \
"
