# copied from meta-qt6, before it was removed from meta-qt6 in:
# https://codereview.qt-project.org/gitweb?p=yocto/meta-qt6.git;a=commit;h=29999c4ffbe83ee3c850b4e3a2fddd132c7ec826
#
# QtGraphicalEffects has been moved to be part of qt5compat
# module for compatibility with Qt 5 code. This can be accessed
# by importing "Qt5Compat.GraphicalEffects
#
LICENSE = "GFDL-1.3 & BSD-3-Clause & ( GPL-3.0-only & Qt-GPL-exception-1.0 ) | The-Qt-Company-Commercial"
LIC_FILES_CHKSUM = " \
    file://LICENSE.BSD;md5=b2609ece79465e2b9eb9b94e80b03e5e \
    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
"

inherit qt6-cmake

include recipes-qt/qt6/qt6-git.inc
include recipes-qt/qt6/qt6.inc

DEPENDS += "qtbase qtdeclarative qtdeclarative-native"

PV = "6.2.0"
QT_MODULE_BRANCH = "6.2"

SRCREV = "59ab3e11433a5157aac0f3af7c0d7fe70a373373"

# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/894424
# ERROR: QA Issue: File /usr/src/debug/qtgraphicaleffects/6.2.0/src/effects/.qt/rcc/qrc_qtgraphicaleffectsshaders.cpp in package qtgraphicaleffects-src contains reference to TMPDIR
# File /usr/src/debug/qtgraphicaleffects/6.2.0/src/effects/.qt/rcc/qrc_qtgraphicaleffectsplugin_raw_qml_0.cpp in package qtgraphicaleffects-src contains reference to TMPDIR
# File /usr/src/debug/qtgraphicaleffects/6.2.0/src/effects/.qt/rcc/qrc_qmake_QtGraphicalEffects.cpp in package qtgraphicaleffects-src contains reference to TMPDIR
# File /usr/src/debug/qtgraphicaleffects/6.2.0/src/effects/private/.qt/rcc/qrc_qtgraphicaleffectsprivate_raw_qml_0.cpp in package qtgraphicaleffects-src contains reference to TMPDIR
# File /usr/src/debug/qtgraphicaleffects/6.2.0/src/effects/private/.qt/rcc/qrc_qmake_QtGraphicalEffects_private.cpp in package qtgraphicaleffects-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
