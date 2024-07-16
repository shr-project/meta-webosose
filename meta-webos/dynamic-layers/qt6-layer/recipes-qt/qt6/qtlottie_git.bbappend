
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895275
# ERROR: QA Issue: File /usr/src/debug/qtlottie/6.7.2/src/imports/.qt/rcc/qrc_qmake_Qt_labs_lottieqt.cpp in package qtlottie-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
