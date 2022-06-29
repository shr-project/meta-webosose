# Copyright (c) 2012-2022 LG Electronics, Inc.

SUMMARY = "Provides preference, timezone and ringtone services"
AUTHOR = "Keith Derrick <keith.derrick@lge.com>"
SECTION = "webos/base"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=7bd705f8ae3d5077cbd3da7078607d8b \
    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

VIRTUAL-RUNTIME_ntp ?= "sntp"

DEPENDS = "luna-service2 libpbnjson qtbase uriparser libxml2 sqlite3 pmloglib nyx-lib libwebosi18n"

RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_ntp} tzcode"

WEBOS_VERSION = "4.4.0-21_2d1e59312b516465d40ebcf45559cc3a40578ac6"
PR = "r9"

inherit webos_component
inherit webos_public_repo
inherit webos_enhanced_submissions
inherit webos_system_bus
inherit webos_machine_dep
inherit webos_daemon
inherit webos_cmake_qt6

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

do_install:append() {
    install -d ${D}${datadir}/localization/${BPN}
    cp -rf ${S}/resources ${D}/${datadir}/localization/${BPN}
}

FILES:${PN} += "${datadir}/localization/${BPN}"
