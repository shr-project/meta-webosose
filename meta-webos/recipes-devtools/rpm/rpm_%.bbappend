# Copyright (c) 2016-2021 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos3"

EXTRA_OECONF += "--without-abi-compliance-checker --without-api-sanity-checker"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-build:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-build:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
