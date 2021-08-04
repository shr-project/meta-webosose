# Copyright (c) 2019-2021 LG Electronics, Inc.

SUMMARY = "g-camera-pipeline is a player which uses GStreamer"
AUTHOR = "Praveen P <praveen.p@lge.com>"
SECTION = "webos/media"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
  file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
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

WEBOS_VERSION = "1.0.0-15_e9d8253132f6745c6cbff49a6e7fdd345b50aad9"
PR = "r8"

WEBOS_GIT_PARAM_BRANCH:raspberrypi4 = "@gav"
WEBOS_VERSION:raspberrypi4 = "1.0.0-13.gav.17_95a73bae5c79e5899f1677c7fb77eea22f20e81a"

DEPENDS = "boost gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad pkgconfig umediaserver media-resource-calculator com.webos.service.camera"
DEPENDS:append:rpi = " userland"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

# See the restrictions in CMakeLists.txt
COMPATIBLE_MACHINE = "^raspberrypi3$"
COMPATIBLE_MACHINE:append = "|^raspberrypi4$"

FILES_SOLIBSDEV = ""
FILES:${PN} += "${libdir}/*.so"
FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"

DEPENDS:append = " webos-wayland-extensions"
