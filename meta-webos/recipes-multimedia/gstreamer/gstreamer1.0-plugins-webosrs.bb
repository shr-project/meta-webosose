# Copyright (c) 2023-2025 LG Electronics, Inc.

SUMMARY = "GStreamer Rust Plugins for webos"

inherit webos_public_repo webos_enhanced_submissions pkgconfig
require gstreamer1.0-plugins-webosrs.inc

PR = "${INC_PR}.3"

PACKAGECONFIG = "unifiedsinkbin"
PACKAGECONFIG[unifieddecodebin] = '--features=unifieddecodebin'
PACKAGECONFIG[unifiedsinkbin] = '--features=unifiedsinkbin'

VIDEOSINK ?= "waylandsink"
PACKAGECONFIG:append = " ${VIDEOSINK}"
PACKAGECONFIG[waylandsink] = '--features=waylandsink'

VIDEOCONVERT ?= "videoconvert"
PACKAGECONFIG:append = " ${VIDEOCONVERT}"
PACKAGECONFIG[videoconvert] = '--features=videoconvert'

# remove this when upgrading to walnascar with:
# https://git.openembedded.org/openembedded-core/commit/?id=16745b20452de60ae2474433cc1a2fb1ed9f6a64
CARGO_BUILD_FLAGS:append = " ${PACKAGECONFIG_CONFARGS}"
