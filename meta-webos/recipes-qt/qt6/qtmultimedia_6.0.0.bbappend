# Copyright (c) 2016-2021 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos8"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# Patches based on 5.12.meta-qt5.2
SRC_URI += " \
    file://0001-Add-QMediaPlayerControl-accessor.patch \
"

# this is missing in the upstream recipe, it detects that pkgconfig is missing:
# and then fails because pulseaudio PACKAGECONFIG is enabled but isn't detected:
# ERROR: Feature 'pulseaudio' was enabled, but the pre-condition 'libs.pulseaudio' failed.
# ERROR: Error calling TOPDIR/BUILD/work/qemux86-webos-linux/qtmultimedia/6.0.0-r0/recipe-sysroot-native/usr/bin/qmake -makefile -o Makefile    QT_BUILD_PARTS-=examples QT_BUILD_PARTS-=tests  TOPDIR/BUILD/work/qemux86-webos-linux/qtmultimedia/6.0.0-r0/git/qtmultimedia.pro  --   -alsa -pulseaudio -no-gstreamer
inherit pkgconfig
