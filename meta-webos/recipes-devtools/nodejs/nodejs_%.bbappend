# Copyright (c) 2019-2020 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos7"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-npm:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-npm:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://0001-Use-human-readable-process-name-for-chrome-inspector.patch"
