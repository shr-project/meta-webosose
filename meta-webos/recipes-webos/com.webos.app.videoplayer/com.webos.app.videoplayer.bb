# Copyright (c) 2021-2025 LG Electronics, Inc.

SUMMARY = "Video Player application"
AUTHOR = "VINH VAN LE <vinh5.le@lge.com>"
SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
    file://oss-pkg-info.yaml;md5=3072ffcf5bdbbc376ed21c9d378d14d5 \
"

WEBOS_VERSION = "0.0.1-13_92b0f70dcdd2ed24fa21ca3154c1ab84f075428b"
PR = "r5"

inherit npm
inherit webos_component
inherit webos_enhanced_submissions
inherit webos_enactjs_app
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE} \
    npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
"
S = "${WORKDIR}/git"

WEBOS_ENACTJS_APP_ID = "com.webos.app.videoplayer"
WEBOS_LOCALIZATION_DATA_PATH = "${S}"
WEBOS_LOCALIZATION_XLIFF_BASENAME = "videoplayer"

EXTRA_OENPM = "${WEBOS_NPM_INSTALL_FLAGS} ${@oe.utils.conditional('WEBOS_ENACTJS_PACK_OVERRIDE', '', '--only=production', '', d)}"

do_configure[prefuncs] += "npm_do_configure"
do_compile[prefuncs] += "npm_do_compile"
do_npm_install_postprocess:prepend() {
    cp -rf ${NPM_BUILD}/lib/node_modules/com.webos.app.videoplayer/node_modules ${S}
}
do_npm_install[noexec] = "1"
