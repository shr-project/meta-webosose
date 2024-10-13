# Copyright (c) 2024 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# http://gecko.lge.com:8000/Errors/Details/994125
# ERROR: QA Issue: snapper rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"

# http://gecko.lge.com:8000/Errors/Details/996817
# https://lists.openembedded.org/g/openembedded-devel/message/113164
# https://lists.openembedded.org/g/openembedded-devel/message/113400
FILES:${PN} += "${nonarch_libdir} ${systemd_system_unitdir} ${datadir}"
