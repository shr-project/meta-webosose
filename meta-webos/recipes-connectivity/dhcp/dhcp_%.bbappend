# Copyright (c) 2012-2017 LG Electronics, Inc.

inherit webos_machine_impl_dep

EXTENDPRAUTO:append = "webos6"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://dhclient.conf.upstart"

# Add dhclient upstart script
# (script should be configured to only run dhclient when needed)

do_install:append () {
        install -d ${D}${sysconfdir}/init
        install -m 0644 ${WORKDIR}/dhclient.conf.upstart ${D}${sysconfdir}/init/dhclient.conf
}

FILES:${PN}-client += "${sysconfdir}/init/dhclient.conf"

do_install:append:emulator() {
    # Start dhclient (and dropbear) as early as possible
    # in emulator to make boot-time debugging easier.
    sed -i 's/^start on stopped networking$/start on started bootmisc/g' ${D}${sysconfdir}/init/dhclient.conf
}


