# Copyright (c) 2012-2023 LG Electronics, Inc.

require nodejs-module-webos.inc

AUTHOR = "Rajesh Gopu I.V <rajeshgopu.iv@lge.com>"
SUMMARY = "A module for nodejs that allows Javascript access to the webOS logging system"
LIC_FILES_CHKSUM += "file://oss-pkg-info.yaml;md5=d486dd326df35bb9d577c353691f0455"

DEPENDS += "pmloglib vim-native"

WEBOS_VERSION = "3.0.1-7_f08fbbec80e018cccf71d4f1ddae8a3f43a8895b"
PR = "r15"

# [http://gpro.lge.com/c/webosose/nodejs-module-webos-pmlog/+/344284 Fix build with nodejs-14]
# [http://gpro.lge.com/c/webosose/nodejs-module-webos-pmlog/+/344285 Fix build with nodejs-18]
SRC_URI += "file://0001-Fix-build-with-nodejs-14.patch \
    file://0002-Fix-build-with-nodejs-18.patch \
"

do_configure() {
    cd src
    sh -c "xxd -i pmloglib.js > pmloglib.js.h"
    cd ..
    ${WEBOS_NODE_GYP} configure
}

do_compile() {
    ${WEBOS_NODE_GYP} build
}

WEBOS_NODE = "pmloglib.node"
