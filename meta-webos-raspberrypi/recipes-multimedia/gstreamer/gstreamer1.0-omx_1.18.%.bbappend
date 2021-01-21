# Copyright (c) 2018-2020 LG Electronics, Inc.

EXTENDPRAUTO_append_rpi = "webosrpi6"

CPPFLAGS_append_rpi = " -I${STAGING_INCDIR}/IL \
    -I${STAGING_INCDIR}/interface/vcos/pthreads \
    -I${STAGING_INCDIR}/interface/vmcs_host/linux"

DEPENDS_append_rpi = " virtual/egl virtual/libomxil"

EXTRA_LDFLAGS_rpi = "-lEGL -lbcm_host -lvcos -lvchiq_arm -lopenmaxil"

# raspberrypi3-64 version of userland doesn't provide bcm_host and openmaxil libraries
# (that's actually the only difference between set of files staged by userland build for raspberrypi3 and raspberrypi3-64)
EXTRA_LDFLAGS_raspberrypi3-64 = "-lEGL -lvcos -lvchiq_arm"

# Build for raspberrypi4
EXTRA_LDFLAGS_raspberrypi4-64 = "-lEGL -lvcos -lvchiq_arm"

LDFLAGS_append_rpi = " ${EXTRA_LDFLAGS}"

GSTREAMER_1_0_OMX_CORE_NAME_rpi = "${libdir}/libopenmaxil.so"
GSTREAMER_1_0_OMX_TARGET_rpi = "rpi"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append_rpi = " \
    file://0001-fix-adaptive-resolution-change-in-seek-issue.patch \
    file://0003-decrease-ranking-of-omxh264dec.patch \
"

