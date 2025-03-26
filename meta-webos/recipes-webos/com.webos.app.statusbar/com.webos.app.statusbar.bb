# Copyright (c) 2022-2025 LG Electronics, Inc.

SUMMARY = "Status Bar Application"
AUTHOR = "Muniraju A<muniraju.a@lge.com>"
SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
    file://oss-pkg-info.yaml;md5=0ec407cd2d4a192e0c60888f4ec66dd7 \
"

WEBOS_VERSION = "0.0.1-7_0fd67e20ba223e92a876679abbaed40000a6b5ab"
SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE} \
    npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
"
S = "${WORKDIR}/git"
PR = "r2"

inherit npm
inherit webos_enhanced_submissions
inherit webos_enactjs_app
inherit webos_public_repo


WEBOS_ENACTJS_APP_ID = "com.webos.app.statusbar"

EXTRA_OENPM = "${WEBOS_NPM_INSTALL_FLAGS} ${@oe.utils.conditional('WEBOS_ENACTJS_PACK_OVERRIDE', '', '--only=production', '', d)}"

do_configure[prefuncs] += "npm_do_configure"
do_compile[prefuncs] += "npm_do_compile"
do_npm_install_postprocess:prepend() {
    cp -rf ${NPM_BUILD}/lib/node_modules/volume/node_modules ${S}
}
do_npm_install[noexec] = "1"
