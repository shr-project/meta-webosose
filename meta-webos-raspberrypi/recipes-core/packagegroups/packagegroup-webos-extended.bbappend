# Copyright (c) 2017-2019 LG Electronics, Inc.

# You don't need to change this value when you're changing just a RDEPENDS_${PN} variable.
EXTENDPRAUTO_append_rpi = "webosrpi6"

# gst omx is used only for raspberrypi3 builds
MEDIA_append_rpi = " \
    gstreamer1.0-omx \
"
# Until build issues caused by PLAT-44962 are fixed in PLAT-45700
MEDIA_raspberrypi3-64 = ""
MEDIA_raspberrypi4-64 = ""

TTSSERVICE = " \
"

CIMSERVICE = " \
    com.webos.service.contextintentmgr \
"
# The same restrition as nodejs (and nodejs-module-node-red and com.webos.service.contextintentmgr)
CIMSERVICE_armv4 = ""
CIMSERVICE_armv5 = ""
CIMSERVICE_mips64 = ""

CAMERASERVICE = " \
    com.webos.service.camera \
    g-camera-pipeline \
"

# TTS service functionality cannot be verified on webOS rpi64 which cannot boot yet
TTSSERVICE_raspberrypi3-64 = ""
TTSSERVICE_raspberrypi4-64 = ""

# CIM service functionality not been verified on webOS rpi64 which cannot boot yet
CIMSERVICE_raspberrypi3-64 = ""
CIMSERVICE_raspberrypi4-64 = ""

# camera service functionality cannot be verified on webOS rpi64 which cannot boot yet
CAMERASERVICE_raspberrypi3-64 = ""
CAMERASERVICE_raspberrypi4-64 = ""

RDEPENDS_${PN}_append_rpi = " \
    com.webos.service.audiooutput \
    resize-rootfs \
    ${CAMERASERVICE} \
    ${TTSSERVICE} \
    ${CIMSERVICE} \
"

# TODO move this part to webOS FOTA service (not yet developped) later
RDEPENDS_${PN}_append_rpi_sota = " \
    u-boot-fw-utils \
"
