# Copyright (c) 2023 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# ERROR: QA Issue: libgpiod-ptest rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-ptest:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-ptest:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
# http://gecko.lge.com:8000/Errors/Details/1003241
# ERROR: QA Issue: libgpiod rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
# RDEPENDS:${PN}:remove:class-target doesn't work for runtime dependency
# added from PACKAGECONFIG, so we need to overwrite tests PACKAGECONFIG
# added in:
# https://git.openembedded.org/meta-openembedded/commit/?id=9626e8a2c8f20c7ff81a336e0adebd1b74bb9ac7
# to respect VIRTUAL-RUNTIME_bash directly. See similar example in:
# http://gpro.lge.com/c/webos-pro/meta-lg-webos/+/380100
PACKAGECONFIG[tests] = " \
    --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-glib --enable-gpioset-interactive --enable-dbus, \
    --disable-tests, \
    kmod util-linux glib-2.0 catch2 libedit glib-2.0-native libgudev, \
    ${VIRTUAL-RUNTIME_bash} dbus glib-2.0-utils libgpiod-manager shunit2 \
"
