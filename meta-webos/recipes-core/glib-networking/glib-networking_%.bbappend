# Copyright (c) 2021 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

# ERROR: glib-networking-2.68.1-r0 do_package_qa: QA Issue: /usr/libexec/installed-tests/glib-networking/files/create-files.sh contained in package glib-networking-ptest requires /bin/bash, but no providers found in RDEPENDS_glib-networking-ptest? [file-rdeps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}-ptest_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}-ptest_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
