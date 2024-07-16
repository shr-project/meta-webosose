
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895290
# ERROR: QA Issue: File /usr/bin/.debug/ippoolconfig in package ippool-dbg contains reference to TMPDIR
# File /usr/lib/pppd/2.5.0/.debug/ippool.so in package ippool-dbg contains reference to TMPDIR
# File /usr/sbin/.debug/ippoold in package ippool-dbg contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/lib/libusl.a in package ippool-staticdev contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
