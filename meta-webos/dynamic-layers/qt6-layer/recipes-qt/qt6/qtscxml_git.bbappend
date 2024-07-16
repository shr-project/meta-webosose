
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895286
# ERROR: QA Issue: File /usr/src/debug/qtscxml/6.7.2/src/statemachineqml/.qt/rcc/qrc_qmake_QtQml_StateMachine.cpp in package qtscxml-src contains reference to TMPDIR
# File /usr/src/debug/qtscxml/6.7.2/src/scxmlqml/.qt/rcc/qrc_qmake_QtScxml.cpp in package qtscxml-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
