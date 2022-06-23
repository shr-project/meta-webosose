# Copyright (c) 2022 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# ERROR: QA Issue: /usr/lib/libgcrypt/ptest/libgcrypt-1.10.1/tests/basic_all_hwfeature_combinations.sh contained in package libgcrypt-ptest requires /bin/bash, but no providers found in RDEPENDS:libgcrypt-ptest? [file-rdeps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-ptest:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-ptest:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
