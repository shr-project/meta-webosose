
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895280
# ERROR: QA Issue: File /usr/src/debug/qtquick3dphysics/6.7.2/src/quick3dphysics/.qt/rcc/qrc_qmake_QtQuick3D_Physics.cpp in package qtquick3dphysics-src contains reference to TMPDIR
# File /usr/src/debug/qtquick3dphysics/6.7.2/src/helpers/.qt/rcc/qrc_qmake_QtQuick3D_Physics_Helpers.cpp in package qtquick3dphysics-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
