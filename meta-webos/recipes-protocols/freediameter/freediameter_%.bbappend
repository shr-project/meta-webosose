
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895267
# ERROR: QA Issue: File /usr/lib/freeDiameter/ptest/CTestTestfile.cmake in package freediameter-ptest contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/src/debug/freediameter/1.5.0+git/extensions/app_redirect/ard_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_redirect/ard_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_redirect/lex.ard_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_radgw/lex.rgw_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_radgw/rgwx_echodrop.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_radgw/rgw_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_radgw/lex.rgwx_echodrop.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_radgw/rgw_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/app_radgw/rgwx_echodrop.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_rewrite/lex.rt_rewrite_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_rewrite/rt_rewrite_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_rewrite/rt_rewrite_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_default/lex.rtd_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_default/rtd_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_default/rtd_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/acl_wl/aw_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/acl_wl/aw_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/acl_wl/lex.aw_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/test_netemul/lex.test_netemul.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/test_netemul/test_netemul.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/test_netemul/test_netemul.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/test_app/ta_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/test_app/lex.ta_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/test_app/ta_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_deny_by_size/rt_deny_by_size_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_deny_by_size/lex.rt_deny_by_size_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_deny_by_size/rt_deny_by_size_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_busypeers/lex.rtbusy_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_busypeers/rtbusy_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/rt_busypeers/rtbusy_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/dbg_loglevel/dbg_loglevel_conf.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/dbg_loglevel/lex.dbg_loglevel_conf.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/extensions/dbg_loglevel/dbg_loglevel_conf.tab.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/libfdcore/lex.fdd.c in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/libfdcore/fdd.tab.h in package freediameter-src contains reference to TMPDIR
# File /usr/src/debug/freediameter/1.5.0+git/libfdcore/fdd.tab.c in package freediameter-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
