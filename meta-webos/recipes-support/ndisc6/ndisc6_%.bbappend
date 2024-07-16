
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895309
# ERROR: QA Issue: File /usr/sbin/rdnssd in package ndisc6-rdnssd contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/bin/name2addr in package ndisc6-misc contains reference to TMPDIR
# File /usr/bin/tcpspray in package ndisc6-misc contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/bin/rdisc6 in package ndisc6-rdisc6 contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/bin/rltraceroute6 in package ndisc6-rltraceroute6 contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/bin/ndisc6 in package ndisc6-ndisc6 contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
