# Copyright (c) 2021 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

# ERROR: lib32-libpam-1.5.1-r0 do_package_qa: QA Issue: /usr/share/Linux-PAM/xtests/tst-pam_motd4.sh contained in package lib32-libpam-xtests requires /bin/bash, but no providers found in RDEPENDS_lib32-libpam-xtests? [file-rdeps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}-xtests_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}-xtests_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
