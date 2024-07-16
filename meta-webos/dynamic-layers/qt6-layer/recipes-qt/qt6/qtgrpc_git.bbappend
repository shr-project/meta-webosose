
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895287
# ERROR: QA Issue: File /usr/lib/cmake/Qt6ProtobufWellKnownTypes/Qt6ProtobufWellKnownTypesTargets.cmake in package qtgrpc-dev contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
