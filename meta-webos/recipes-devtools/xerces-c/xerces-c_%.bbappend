
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/899677
# ERROR: QA Issue: File /usr/lib32/pkgconfig/xerces-c.pc in package lib32-libxerces-c-dev contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
