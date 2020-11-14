# Copyright (c) 2017-2021 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}-fstools_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}-fstools_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
