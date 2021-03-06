# Copyright (c) 2015-2021 LG Electronics, Inc.

SUMMARY = "Settings Service Configs"
AUTHOR = "Denys Romanchuk <denys.romanchuk@lge.com>"
SECTION = "webos/base"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

WEBOS_VERSION = "1.0.0-8_280fb64b45ef9cb2c0a88d03cda7fe88afc001d9"
PR = "r1"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_public_repo

WEBOS_REPO_NAME = "webos-settingsservice-conf"
SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"

S = "${WORKDIR}/git"
