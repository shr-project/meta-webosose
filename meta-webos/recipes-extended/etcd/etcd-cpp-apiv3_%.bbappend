
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895281
# ERROR: QA Issue: File /usr/lib/cmake/etcd-cpp-api/etcd-targets.cmake in package etcd-cpp-apiv3-dev contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
