
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895270
# ERROR: QA Issue: File /usr/src/debug/qtpositioning/6.7.2/src/positioningquick/.qt/rcc/qrc_qmake_QtPositioning.cpp in package qtpositioning-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
