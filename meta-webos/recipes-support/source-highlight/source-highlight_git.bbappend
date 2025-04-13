# Copyright (c) 2025 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-tools:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-tools:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
