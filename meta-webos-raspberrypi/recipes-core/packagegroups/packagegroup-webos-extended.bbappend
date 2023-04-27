# Copyright (c) 2017-2023 LG Electronics, Inc.

# You don't need to change this value when you're changing just a RDEPENDS:${PN} variable.
EXTENDPRAUTO:append:rpi = "webosrpi11"

# gst omx is used only for raspberrypi builds
VIRTUAL-RUNTIME_media:append:rpi = " \
    gstreamer1.0-omx \
"

VIRTUAL-RUNTIME_com.webos.service.cec ?= ""
# CEC service functionality is supported only for webOS OSE rpi4-64
VIRTUAL-RUNTIME_com.webos.service.cec:raspberrypi4-64 = " \
    com.webos.service.cec \
"

VIRTUAL-RUNTIME_part-initializer ?= ""
VIRTUAL-RUNTIME_part-initializer:rpi = "${@bb.utils.contains('DISTRO_FEATURES', 'sota', 'resize-rootfs', 'setup-partitions', d)}"

RDEPENDS:${PN}:append:rpi = " \
    alsa-utils \
    boot-verifier \
    com.webos.service.audiofocusmanager \
    com.webos.service.audiooutput \
    com.webos.service.hfp \
    com.webos.service.location \
    com.webos.service.mediaindexer \
    com.webos.service.peripheralmanager \
    com.webos.service.power2 \
    libbootctrl-tests \
    ofono \
    ${VIRTUAL-RUNTIME_com.webos.service.cec} \
    ${VIRTUAL-RUNTIME_part-initializer} \
"
