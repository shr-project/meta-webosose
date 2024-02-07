# Copyright (c) 2018-2024 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos7"

PACKAGECONFIG:remove = "rsvg"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
SRC_URI:append:qemuall = " \
    file://0004-waylandsink-remove-unsupported-subcompositor.patch;striplevel=3 \
    file://0005-h264parse-resolution-changed-event-support.patch;striplevel=3 \
"

SRC_URI:append = " \
    file://0006-fix-Webex-meeting-Participant-video-screen-is-gray.patch \
"
