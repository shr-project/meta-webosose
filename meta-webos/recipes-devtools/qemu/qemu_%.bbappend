# Copyright (c) 2017-2023 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos4"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
RDEPENDS:${PN}-ptest:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-ptest:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"

# ERROR: qemu-8.0.0-r0 do_package_qa: QA Issue: qemu-user-mips rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
# http://gecko.lge.com:8000/Errors/Details/617757
RDEPENDS:${PN}-user-mips:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-user-mips:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
