# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

VIRTUAL-RUNTIME_bash ?= "bash"
# ERROR: expat-2.2.9-r0 do_package_qa: QA Issue: /usr/lib/expat/ptest/run-ptest contained in package expat-ptest requires /bin/bash, but no providers found in RDEPENDS_expat-ptest? [file-rdeps]
RDEPENDS_${PN}-ptest_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}-ptest_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
