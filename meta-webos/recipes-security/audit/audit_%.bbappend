# Copyright (c) 2021 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

# ERROR: audit-3.0.1-r0 do_package_qa: QA Issue: auditd rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_auditd_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_auditd_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
