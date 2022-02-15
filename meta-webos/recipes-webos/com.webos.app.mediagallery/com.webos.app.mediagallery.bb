# Copyright (c) 2020-2022 LG Electronics, Inc.

# Confidential computer software. Valid license from LG required for
# possession, use or copying. Consistent with FAR 12.211 and 12.212,
# Commercial Computer Software, Computer Software Documentation, and
# Technical Data for Commercial Items are licensed to the U.S. Government
# under vendor's standard commercial license.

SUMMARY = "Mediagallery QML App"
AUTHOR = "Hyein Lee<hyein1.lee@lge.com>"
SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
"

DEPENDS = "qtdeclarative pmloglib luna-service2 libpbnjson"
DEPENDS_append = " ${@ 'qtshadertools-native' if d.getVar('QT_VERSION', True) == '6' else '' }"

RDEPENDS_${PN} += "qml-webos-framework qml-webos-bridge"

WEBOS_VERSION = "1.0.0-17_4fe324a62ee8d06e344e935f17cbda3d3e568b59"
SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"
PR = "r2"

inherit webos_enhanced_submissions
inherit webos_public_repo
inherit webos_localizable
inherit webos_qmake6
inherit systemd
inherit webos_system_bus
inherit webos_app

QMAKE_PROFILES = "${S}/com.webos.app.mediagallery.pro"
QE_QMAKE_PATH_HEADERS = "${QE_QMAKE_PATH_QT_HEADERS}"

FILES_${PN} += "${webos_applicationsdir}"
