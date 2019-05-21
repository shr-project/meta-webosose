# Copyright (c) 2013-2019 LG Electronics, Inc.

DESCRIPTION = "Notification Manager"
AUTHOR = "Suresh Arumugam <suresh.arumugam@lge.com>"
SECTION = "webos/base"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

DEPENDS = "glib-2.0 luna-service2 libpbnjson pmloglib boost libxml++"

WEBOS_VERSION = "1.0.0-4_f749cc35707ebf07c8956ddbb1baa66b28169b64"
PR = "r6"

inherit webos_component
inherit webos_cmake
inherit webos_enhanced_submissions
inherit webos_daemon
inherit webos_system_bus
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

FILES_${PN} += "${webos_prefix}"
