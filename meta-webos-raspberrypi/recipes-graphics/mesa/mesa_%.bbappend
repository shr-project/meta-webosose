# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosrpi6"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append:rpi = " \
    file://0001-implement-drm_create_linear_prime_buffer.patch \
"
