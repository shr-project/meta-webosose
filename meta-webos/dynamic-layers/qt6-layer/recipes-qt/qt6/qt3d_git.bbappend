
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895289
# ERROR: QA Issue: File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/logic/.qt/rcc/qrc_qmake_Qt3D_Logic.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/input/.qt/rcc/qrc_qmake_Qt3D_Input.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/render/.qt/rcc/qrc_qmake_Qt3D_Render.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/animation/.qt/rcc/qrc_qmake_Qt3D_Animation.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/scene2d/.qt/rcc/qrc_qmake_QtQuick_Scene2D.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/extras/.qt/rcc/qrc_qmake_Qt3D_Extras.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/scene3d/.qt/rcc/qrc_qmake_QtQuick_Scene3D.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/imports/scene3d/.qt/rcc/qrc_scene3d.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/quick3d/quick3d/.qt/rcc/qrc_qmake_Qt3D_Core.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/render/.qt/rcc/qrc_materialsystem.cpp in package qt3d-src contains reference to TMPDIR
# File /usr/src/debug/qt3d/6.7.2/src/extras/.qt/rcc/qrc_extras.cpp in package qt3d-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
