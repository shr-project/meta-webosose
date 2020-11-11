# Copyright (c) 2018-2020 LG Electronics, Inc.

SUMMARY = "Service which controls audio output"
AUTHOR = "Premalatha MVS <premalatha.mvs@lge.com>"
SECTION = "webos/services"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
file://CMakeLists.txt;beginline=1;endline=15;md5=232fd0174eef9aa036a9c08ff983b67b \
file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "glib-2.0 luna-service2 pmloglib libpbnjson umi"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_daemon
inherit webos_library
inherit webos_system_bus
inherit webos_public_repo

WEBOS_VERSION = "1.0.0-3_30fc71651b584da0a1ba18d23f277487000e15ea"
PR = "r1"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"
