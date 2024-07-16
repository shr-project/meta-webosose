
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895264
# ERROR: QA Issue: File /usr/src/debug/qtquicktimeline/6.7.2/src/timeline/.qt/rcc/qrc_qmake_QtQuick_Timeline.cpp in package qtquicktimeline-src contains reference to TMPDIR
# File /usr/src/debug/qtquicktimeline/6.7.2/src/timeline/blendtrees/.qt/rcc/qrc_qmake_QtQuick_Timeline_BlendTrees.cpp in package qtquicktimeline-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
