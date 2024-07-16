
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895274
# ERROR: QA Issue: File /usr/src/debug/qtwebchannel/6.7.2/src/webchannel/.qt/rcc/qrc_resources.cpp in package qtwebchannel-src contains reference to TMPDIR
# File /usr/src/debug/qtwebchannel/6.7.2/src/webchannelquick/.qt/rcc/qrc_qmake_QtWebChannel.cpp in package qtwebchannel-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
