# Copyright (c) 2019-2024 LG Electronics, Inc.

SUMMARY = "General System Launcher application"
AUTHOR = "KIEN TRUNG PHAM <kien2.pham@lge.com>"
SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
    file://oss-pkg-info.yaml;md5=0ec407cd2d4a192e0c60888f4ec66dd7 \
"

WEBOS_VERSION = "0.1.0-38_831310d5750343523e0d39fc8c52d3c18a5c7c5b"
SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"
PR = "r5"

inherit webos_enhanced_submissions
inherit webos_enactjs_app
inherit webos_public_repo
inherit webos_localizable


WEBOS_ENACTJS_APP_ID = "com.webos.app.home"
WEBOS_LOCALIZATION_XLIFF_BASENAME = "home"

# Workaround for network access issue during do_compile task
do_compile[network] = "1"
