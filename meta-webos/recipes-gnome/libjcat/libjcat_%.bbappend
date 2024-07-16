
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895272
# ERROR: QA Issue: File /usr/libexec/installed-tests/libjcat/jcat-self-test in package libjcat-ptest contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
