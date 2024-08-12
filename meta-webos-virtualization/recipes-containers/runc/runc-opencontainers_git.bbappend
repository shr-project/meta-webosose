# Copyright (c) 2019-2024 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosvirt1"

RRECOMMENDS:${PN}:remove = "lxc"

# http://gecko.lge.com:8000/Errors/Details/982454
# ERROR: QA Issue: runc-opencontainers-check rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-check:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-check:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
