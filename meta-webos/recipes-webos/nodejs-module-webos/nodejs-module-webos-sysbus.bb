# Copyright (c) 2012-2020 LG Electronics, Inc.

require nodejs-module-webos.inc

SUMMARY = "A module for nodejs that allows Javascript access to the webOS system bus"
LIC_FILES_CHKSUM += "file://oss-pkg-info.yaml;md5=ab2a5dc5745e5204bf0926e2d6ccf877"

DEPENDS += "glib-2.0 luna-service2"

inherit webos_system_bus

WEBOS_VERSION = "3.0.1-6_855889b1c0c344baed15bd8d69f05d661bd67d01"
PR = "r14"

do_configure() {
    export GYP_DEFINES="sysroot=${STAGING_DIR_HOST}"
    # used by binding.gyp
    export webos_servicesdir="${webos_servicesdir}" webos_prefix="${webos_prefix}"
    node-gyp --arch ${TARGET_ARCH} --nodedir "${WORKDIR}/node-v${NODE_VERSION}" configure
}

do_compile() {
    export GYP_DEFINES="sysroot=${STAGING_DIR_HOST}"
    # used by binding.gyp
    export webos_servicesdir="${webos_servicesdir}" webos_prefix="${webos_prefix}"
    node-gyp --arch ${TARGET_ARCH} build
}

WEBOS_NODE = "webos-sysbus.node"

do_install_append() {
    install ${S}/src/palmbus.js ${D}${libdir}/nodejs/palmbus.js
    # XXX Temporarily add symlink to old location until all users of it are changed
    ln -svnf ${libdir}/nodejs/palmbus.js ${D}${webos_prefix}/nodejs/
    # The CMake build did this with macros
    install -d ${D}${webos_sysbus_rolesdir}
    sed "s|@WEBOS_INSTALL_BINDIR@|$bindir|" < ${S}/files/sysbus/com.webos.nodejs.role.json.in > ${D}${webos_sysbus_rolesdir}/com.webos.nodejs.role.json
}
