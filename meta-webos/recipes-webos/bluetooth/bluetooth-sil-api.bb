# Copyright (c) 2014-2021 LG Electronics, Inc.

SUMMARY = "webOS Bluetooth SIL API"
AUTHOR = "Sameer Mulla <sameer.mulla@lge.com>"
SECTION = "webos/services"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=e07d738b032e6351a6608e81ea1b1b49 \
"

DEPENDS = "glib-2.0"

WEBOS_VERSION = "1.0.0-24_1a28127c00fbd2d8d7fd746142fd9a77f4d13d0c"
PR = "r2"

inherit webos_component
inherit webos_public_repo
inherit webos_enhanced_submissions
inherit webos_cmake

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

EXTRA_OECMAKE += "-DWEBOS_CONFIG_BUILD_TESTS:BOOL=TRUE"

PACKAGES =. "${PN}-tests "
FILES:${PN}-tests = "${bindir}/bluetooth-sil-tester"

ALLOW_EMPTY:${PN} = "1"
