# Copyright (c) 2018-2022 LG Electronics, Inc.

SUMMARY = "G media pipeline is a media pipeline which uses GStreamer"
AUTHOR = "Jinwoo Ahn <jinwoo.ahn@lge.com>"
SECTION = "webos/media"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

inherit webos_component
inherit webos_cmake
inherit webos_system_bus
inherit webos_enhanced_submissions
inherit webos_public_repo
inherit webos_machine_impl_dep
inherit webos_machine_dep
inherit webos_pkgconfig

# media-resource-calculator since submissions 47 isn't usable for any other MACHINE than
# raspberrypi3
# raspberrypi3-64
# raspberrypi4
# raspberrypi4-64
# qemux86
# qemux86-64
COMPATIBLE_MACHINE = "^qemux86$|^qemux86-64$|^raspberrypi3$|^raspberrypi3-64$|^raspberrypi4$|^raspberrypi4-64$"

# raspberrypi4 and qemux86 uses @gav branch
PR = "r10"
DEPENDS = "boost gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad umediaserver media-resource-calculator webos-wayland-extensions"
DEPENDS:append:rpi = " virtual/libomxil"

WEBOS_GIT_PARAM_BRANCH = "@gav"
WEBOS_VERSION = "1.0.0-21.gav.29_d2e18f2123889296be4410a1175b3773b2df77a6"

# raspberrypi3 uses @21.master branch
DEPENDS:remove:raspberrypi3 = "webos-wayland-extensions"
WEBOS_GIT_PARAM_BRANCH:raspberrypi3 = "@21.master"
WEBOS_VERSION:raspberrypi3 = "1.0.0-21.master.1_5780fa2b8466405a9873df1e64621f5930e00686"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

FILES_SOLIBSDEV = ""
FILES:${PN} += "${libdir}/*.so"
