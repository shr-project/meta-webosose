# Copyright (c) 2018-2021 LG Electronics, Inc.

EXTENDPRAUTO:append:rpi = "webosrpi4"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append:raspberrypi4 = " \
    file://0001-v4l2-fix-buffer-pool-poll-wait-after-flush.patch \
    file://0002-v4l2videodec-Check-stop-in-flush-to-avoid-race-condi.patch \
    file://0003-Fix-v4l2h264dec-output-caps-to-RGB16.patch \
    file://0004-Fix-v4l2dec-flush-for-video-loop-playback.patch \
"

PACKAGECONFIG:append:raspberrypi4 = " libv4l2"
