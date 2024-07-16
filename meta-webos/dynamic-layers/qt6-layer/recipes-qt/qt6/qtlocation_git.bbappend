
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895279
# ERROR: QA Issue: File /usr/src/debug/qtlocation/6.7.2/src/location/.qt/rcc/qrc_qmake_QtLocation.cpp in package qtlocation-src contains reference to TMPDIR
# File /usr/src/debug/qtlocation/6.7.2/src/location/.qt/rcc/qrc_Location_raw_qml_0.cpp in package qtlocation-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
