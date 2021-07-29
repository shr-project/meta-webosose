# Copyright (c) 2017-2021 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos6"

inherit webos_prerelease_dep

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}-kernel-install:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-kernel-install:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
RDEPENDS:${PN}-ptest:append:class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}-ptest:remove:class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"

RDEPENDS:${PN}:remove = "update-rc.d"

PACKAGECONFIG:remove = " \
    networkd    \
    resolved    \
    nss-resolve \
    timedated   \
    timesyncd   \
"

PACKAGECONFIG:append = " \
    ${@oe.utils.conditional('WEBOS_DISTRO_PRERELEASE', 'devel', 'coredump', '', d)} \
    ${@oe.utils.conditional('WEBOS_DISTRO_PRERELEASE', 'devel', 'elfutils', '', d)} \
"

# By default systemd's Predictable Network Interface Names policy configured for qemu
# Currently we don't support this policy in qemu, so removing from systemd's configuration
do_install:append:qemuall() {
    rm -rf ${D}/${base_libdir}/systemd/network/99-default.link
}
