# Copyright (c) 2019 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos3"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}-npm_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}-npm_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
