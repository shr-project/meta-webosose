# Copyright (c) 2020-2025 LG Electronics, Inc.

EXTENDPRAUTO:append:rpi = "webosrpi11"

FILESEXTRAPATHS:prepend:rpi := "${THISDIR}/${BPN}:"

SRC_URI:append:rpi = " \
"

# kmsro removed in https://gitlab.freedesktop.org/mesa/mesa/-/commit/89863a050bea429d9574a307bc28953bb60accaf
# https://lists.openembedded.org/g/openembedded-core/message/214733
PACKAGECONFIG:remove = "kmsro"
