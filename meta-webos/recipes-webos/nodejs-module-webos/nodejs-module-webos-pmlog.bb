# Copyright (c) 2012-2018 LG Electronics, Inc.

SUMMARY = "A module for nodejs that allows Javascript access to the webOS logging system"
AUTHOR = "Anatolii Sakhnik <anatolii.sakhnik@lge.com>"
SECTION = "webos/nodejs/module"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

DEPENDS = "pmloglib node-gyp-native vim-native"

WEBOS_VERSION = "3.0.1-1_03fc1bc90518390eea0acd7639d6074c16c61195"
PR = "r6"

inherit webos_component
inherit webos_public_repo
inherit webos_enhanced_submissions
inherit webos_library
inherit webos_filesystem_paths
inherit python3native

export PYTHON = "python"

NODE_VERSION = "12.18.3"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE} \
    https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.xz;name=node \
    file://0001-Fix-build-for-nodejs-v12.patch \
"
SRC_URI[node.sha256sum] = "71158026579487422fd13cc2553b34cddb76519098aa6030faab52f88c6e0d0e"
S = "${WORKDIR}/git"

do_configure() {
    export HOME=${WORKDIR}
    export LD="${CXX}"
    cd src
    sh -c "xxd -i pmloglib.js > pmloglib.js.h"
    cd ..
    node-gyp --arch ${TARGET_ARCH} --nodedir "${WORKDIR}/node-v${NODE_VERSION}" configure
}

do_compile() {
    export HOME=${WORKDIR}
    export LD="${CXX}"
    node-gyp --arch ${TARGET_ARCH} build
}

do_install() {
    install -d ${D}${libdir}/nodejs
    install ${S}/build/Release/pmloglib.node ${D}${libdir}/nodejs/pmloglib.node
}

# XXX Temporarily add symlink to old location until all users of it are changed
FILES_${PN} += "${webos_prefix}/nodejs"
do_install_append() {
    install -d ${D}${webos_prefix}/nodejs
    ln -svnf ${libdir}/nodejs/pmloglib.node ${D}${webos_prefix}/nodejs/
}

FILES_${PN} += "${libdir}/nodejs"
