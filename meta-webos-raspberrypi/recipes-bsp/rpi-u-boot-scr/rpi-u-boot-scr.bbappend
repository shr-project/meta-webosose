# Copyright (c) 2019 LG Electronics, Inc.

EXTENDPRAUTO_append = "webosrpi1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://boot.sota.cmd \
    file://uEnv.sota.txt.in \
    file://boot.cmd.mmc.in \
    file://boot.cmd.mmc-optee.in \
    file://boot.cmd.nfs.in \
    file://boot.cmd.nfs-optee.in \
    file://boot.cmd.nfs-script.in \
"

do_compile_append_sota() {
    sed -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' "${WORKDIR}/uEnv.sota.txt.in" > "${WORKDIR}/uEnv.sota.txt"
    mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "Ostree boot script" -d ${WORKDIR}/boot.sota.cmd boot.scr
}

do_deploy_append_sota() {
    install -d ${DEPLOYDIR}/bcm2835-bootfiles
    install -m 0755 ${WORKDIR}/uEnv.sota.txt ${DEPLOYDIR}/bcm2835-bootfiles/uEnv.txt
}

do_compile() {
    for f in boot.cmd.mmc boot.cmd.mmc-optee boot.cmd.nfs boot.cmd.nfs-optee boot.cmd.nfs-script; do
        sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
            -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
            "${WORKDIR}/$f.in" > "${WORKDIR}/$f"
        mkimage -A arm -T script -C none -n "Boot script" -d "${WORKDIR}/$f" $f.scr
    done
}

do_deploy() {
    install -d ${DEPLOYDIR}
    for f in boot.cmd.mmc boot.cmd.mmc-optee boot.cmd.nfs boot.cmd.nfs-optee boot.cmd.nfs-script; do
        install -m 0644 $f.scr ${DEPLOYDIR}
    done
    # by default use the one which just loads kernel from mmc
    install -m 0644 boot.cmd.mmc.scr ${DEPLOYDIR}/boot.scr
}
