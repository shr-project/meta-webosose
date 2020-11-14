# Copyright (c) 2016-2021 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos3"

EXTRA_OECONF += "--without-abi-compliance-checker --without-api-sanity-checker"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}-build_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}-build_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
