# Copyright (c) 2021-2022 LG Electronics, Inc.

SUMMARY = "Video Player application"
AUTHOR = "Anish TD <anish.td@lge.com>"
SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
    file://oss-pkg-info.yaml;md5=3072ffcf5bdbbc376ed21c9d378d14d5 \
"

WEBOS_VERSION = "0.0.1-11_d8847b1ff4bf374b03288492d0e8e6d669c896c3"
PR = "r0"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_enactjs_app
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

WEBOS_ENACTJS_APP_ID = "com.webos.app.videoplayer"
WEBOS_ENACTJS_SHRINKWRAP_OVERRIDE = "false"
WEBOS_LOCALIZATION_DATA_PATH = "${S}"
WEBOS_LOCALIZATION_XLIFF_BASENAME = "videoplayer"
