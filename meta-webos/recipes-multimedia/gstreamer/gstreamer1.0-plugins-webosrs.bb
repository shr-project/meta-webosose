# Copyright (c) 2023-2025 LG Electronics, Inc.

SUMMARY = "GStreamer Rust Plugins for webos"

inherit webos_public_repo webos_enhanced_submissions pkgconfig
require gstreamer1.0-plugins-webosrs.inc

PR = "${INC_PR}.5"

PACKAGECONFIG = "unifiedsinkbin"
PACKAGECONFIG[unifieddecodebin] = '--features=unifieddecodebin'
PACKAGECONFIG[unifiedsinkbin] = '--features=unifiedsinkbin'

VIDEOSINK ?= "waylandsink"
PACKAGECONFIG:append = " ${VIDEOSINK}"
PACKAGECONFIG[waylandsink] = '--features=waylandsink'

VIDEOCONVERT ?= "videoconvert"
PACKAGECONFIG:append = " ${VIDEOCONVERT}"
PACKAGECONFIG[videoconvert] = '--features=videoconvert'

PACKAGECONFIG[lxvideosink] = '--features=lxvideosink'
PACKAGECONFIG[exynosvidconv] = '--features=exynosvidconv'
