
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895277
# ERROR: QA Issue: File /usr/src/debug/qt5compat/6.7.2/src/imports/graphicaleffects5/.qt/rcc/qrc_qmake_Qt5Compat_GraphicalEffects.cpp in package qt5compat-src contains reference to TMPDIR
# File /usr/src/debug/qt5compat/6.7.2/src/imports/graphicaleffects5/.qt/rcc/qrc_qtgraphicaleffectsplugin_raw_qml_0.cpp in package qt5compat-src contains reference to TMPDIR
# File /usr/src/debug/qt5compat/6.7.2/src/imports/graphicaleffects5/.qt/rcc/qrc_qtgraphicaleffectsshaders.cpp in package qt5compat-src contains reference to TMPDIR
# File /usr/src/debug/qt5compat/6.7.2/src/imports/graphicaleffects5/private/.qt/rcc/qrc_qmake_Qt5Compat_GraphicalEffects_private.cpp in package qt5compat-src contains reference to TMPDIR
# File /usr/src/debug/qt5compat/6.7.2/src/imports/graphicaleffects5/private/.qt/rcc/qrc_qtgraphicaleffectsprivate_raw_qml_0.cpp in package qt5compat-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
