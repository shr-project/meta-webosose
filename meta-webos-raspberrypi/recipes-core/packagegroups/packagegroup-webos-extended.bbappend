# Copyright (c) 2017-2021 LG Electronics, Inc.

# You don't need to change this value when you're changing just a RDEPENDS:${PN} variable.
EXTENDPRAUTO:append:rpi = "webosrpi8"

# gst omx is used only for raspberrypi builds
MEDIA:append:rpi = " \
    gstreamer1.0-omx \
"
# Until build issues caused by PLAT-44962 are fixed in PLAT-45700
MEDIA:raspberrypi3-64 = ""

RDEPENDS:${PN}:append:rpi = " \
    com.webos.service.audiofocusmanager \
    com.webos.service.audiooutput \
    com.webos.service.hfp \
    com.webos.service.location \
    com.webos.service.mediaindexer \
    com.webos.service.peripheralmanager \
    com.webos.service.power2 \
    ofono \
    resize-rootfs \
"

# TODO move this part to webOS FOTA service (not yet developped) later
RDEPENDS:${PN}:append:rpi:sota = " \
    u-boot-fw-utils \
"
