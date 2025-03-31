# Copyright (c) 2023-2025 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos2"

# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895312
# ERROR: QA Issue: File /usr/lib/libwolfssl.so.42.1.0 in package wolfssl contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-ptest:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-ptest:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
