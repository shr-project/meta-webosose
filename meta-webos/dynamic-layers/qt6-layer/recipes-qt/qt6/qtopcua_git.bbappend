
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895288
# ERROR: QA Issue: File /usr/src/debug/qtopcua/6.7.2/src/declarative_opcua/.qt/rcc/qrc_qmake_QtOpcUa.cpp in package qtopcua-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
