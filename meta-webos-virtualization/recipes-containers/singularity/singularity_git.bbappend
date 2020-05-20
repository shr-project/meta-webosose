# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "webosvirt1"

# ERROR: singularity-2.3.1+gitAUTOINC+e214d4ebf0-r0 do_package_qa: QA Issue: singularity rdepends on bash, but it isnt a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"

# Fix python3native inherit added in:
# https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=a1e3f5c92cdee7c4259b7be643bd829ce7c1efa3
# to actually work
FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://use-python3.patch"
