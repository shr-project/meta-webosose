# Copyright (c) 2017-2024 LG Electronics, Inc.

EXTENDPRAUTO:append:rpi = "webosrpi6"

inherit features_check
ANY_OF_DISTRO_FEATURES = "vulkan opengl"

FILESEXTRAPATHS:prepend:rpi := "${THISDIR}/${BPN}:"

SRC_URI:append:rpi = " file://0001-Fix-MessageReceived.patch"
