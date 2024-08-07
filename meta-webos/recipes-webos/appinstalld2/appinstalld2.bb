# Copyright (c) 2017-2024 LG Electronics, Inc.

SUMMARY = "Application Install Service"
AUTHOR = "Guruprasad KN <guruprasad.kn@lge.com>"
SECTION = "webos/base"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "glib-2.0 luna-service2 libpbnjson pmloglib pmtrace boost icu"
RDEPENDS:${PN} = "applicationinstallerutility ecryptfs-utils librolegen"

WEBOS_VERSION = "1.0.0-43_da94c85dba584c828c0bb59cdad1ea03c982e4b0"
PR = "r6"

inherit webos_component
inherit webos_cmake
inherit webos_enhanced_submissions
inherit webos_daemon
inherit webos_system_bus
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE} \
    file://0001-CMakeLists.txt-replace-std-c-11-with-std-c-17-for-ic.patch \
"
S = "${WORKDIR}/git"

inherit webos_systemd
WEBOS_SYSTEMD_SERVICE = "appinstalld.service"

