# Copyright (c) 2025 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# The SKIP_RECIPE was removed in scarthgap:
# https://lists.openembedded.org/g/openembedded-devel/message/115780
# but it's still skipped in styhead and newer because of unresolved review comments:
# https://lists.openembedded.org/g/openembedded-devel/message/116508

# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/1155237
# ERROR: QA Issue: File /usr/bin/mongos in package mongodb contains reference to TMPDIR
# File /usr/bin/mongod in package mongodb contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
