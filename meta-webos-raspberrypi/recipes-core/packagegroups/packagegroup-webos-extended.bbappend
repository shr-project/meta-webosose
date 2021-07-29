# Copyright (c) 2017-2021 LG Electronics, Inc.

# You don't need to change this value when you're changing just a RDEPENDS:${PN} variable.
EXTENDPRAUTO:append:rpi = "webosrpi8"

# gst omx is used only for raspberrypi3 builds
MEDIA:append:rpi = " \
    gstreamer1.0-omx \
"
# Until build issues caused by PLAT-44962 are fixed in PLAT-45700
MEDIA:raspberrypi3-64 = ""
MEDIA:raspberrypi4-64 = ""

SAFSERVICE = ""
SAFSERVICE:raspberrypi4 = " \
    com.webos.service.storageaccess \
"

TTSSERVICE = " \
    com.webos.service.tts \
"

CIMSERVICE = " \
    com.webos.service.contextintentmgr \
"
# The same restrition as nodejs (and nodejs-module-node-red and com.webos.service.contextintentmgr)
CIMSERVICE:armv4 = ""
CIMSERVICE:armv5 = ""
CIMSERVICE:mips64 = ""

CAMERASERVICE = " \
    com.webos.service.camera \
    g-camera-pipeline \
"

# TODO: Remove g-camera-pipeline, add it back after it is adapted to GAV
CAMERASERVICE:raspberrypi4 = " \
    com.webos.service.camera \
"

# SAF service functionality cannot be verified on webOS rpi64 which cannot boot yet
SAFSERVICE:raspberrypi4-64 = ""

# TTS service functionality cannot be verified on webOS rpi64 which cannot boot yet
TTSSERVICE:raspberrypi3-64 = ""
TTSSERVICE:raspberrypi4-64 = ""

# CIM service functionality not been verified on webOS rpi64 which cannot boot yet
CIMSERVICE:raspberrypi3-64 = ""
CIMSERVICE:raspberrypi4-64 = ""

# camera service functionality cannot be verified on webOS rpi64 which cannot boot yet
CAMERASERVICE:raspberrypi3-64 = ""
CAMERASERVICE:raspberrypi4-64 = ""

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
    ${CAMERASERVICE} \
    ${SAFSERVICE} \
    ${TTSSERVICE} \
    ${CIMSERVICE} \
"

# TODO move this part to webOS FOTA service (not yet developped) later
RDEPENDS:${PN}:append:rpi:sota = " \
    u-boot-fw-utils \
"
