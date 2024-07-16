
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895269
# ERROR: QA Issue: File /usr/src/debug/qtwebsockets/6.7.2/src/imports/qmlwebsockets/.qt/rcc/qrc_qmake_QtWebSockets.cpp in package qtwebsockets-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
