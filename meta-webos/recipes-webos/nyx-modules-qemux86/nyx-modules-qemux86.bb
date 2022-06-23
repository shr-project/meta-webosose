# Copyright (c) 2016-2022 LG Electronics, Inc.

SUMMARY = "webOS portability layer - qemux86 nyx module"
AUTHOR  = "Sapna Todwal <sapna.todwal@lge.com>"
SECTION = "webos/base"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "nyx-lib glib-2.0 luna-service2 openssl udev"

inherit webos_component
inherit webos_public_repo
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_library
inherit webos_nyx_module_provider

WEBOS_VERSION = "1.0.0-4_c470cca15479bf753b623d5051bca9a673e85036"
PR = "r1"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"
