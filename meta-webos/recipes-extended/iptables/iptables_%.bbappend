# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}-apply_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-apply:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
