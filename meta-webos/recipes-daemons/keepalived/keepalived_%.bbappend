
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895311
# ERROR: QA Issue: File /usr/sbin/keepalived in package keepalived contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
