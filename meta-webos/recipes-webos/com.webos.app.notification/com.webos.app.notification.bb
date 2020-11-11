# Copyright (c) 2019-2020 LG Electronics, Inc.

SUMMARY = "General System Launcher application"
AUTHOR = "Kiho Choi<kiho.choi@lge.com>"
SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
    file://oss-pkg-info.yaml;md5=0ec407cd2d4a192e0c60888f4ec66dd7 \
"

WEBOS_VERSION = "0.1.0-5_38519d741bf75d8482db2aa8690f74d9e986ac57"
SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"
PR = "r1"

inherit webos_enhanced_submissions
inherit webos_enactjs_app
inherit webos_public_repo

WEBOS_ENACTJS_SHRINKWRAP_OVERRIDE = "false"

WEBOS_ENACTJS_APP_ID = "com.webos.app.notification"
