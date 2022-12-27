# Copyright (c) 2017-2023 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos3"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-ctdb-tests:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-ctdb-tests:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
