# Copyright (c) 2014-2021 LG Electronics, Inc.

SUMMARY = "Systemd service files for system services"
AUTHOR = "Sangwoo Kang <sangwoo82.kang@lge.com>"
SECTION = "webos/base"
LICENSE = "Apache-2.0 & MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10 \
                    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

# TODO: systemd dependency is for fake initctl.
# The dependency needs to be deleted after deleting fake initctl.
DEPENDS = "systemd"

VIRTUAL-RUNTIME_rdx-utils ?= "rdxd"
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_init_manager} ${VIRTUAL-RUNTIME_rdx-utils} ${VIRTUAL-RUNTIME_bash} python3"

PROVIDES = "initscripts"
RPROVIDES_${PN} = "initscripts initd-functions"

WEBOS_VERSION = "3.0.0-72_03106cb131a172998eae45833a79187400ba7283"
PR = "r16"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_distro_dep
inherit webos_distro_variant_dep
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

EXTRA_OECMAKE += "-DWEBOS_QTTESTABILITY_ENABLED:BOOL=${@ '1' if d.getVar('WEBOS_DISTRO_PRERELEASE',True) != '' else '0'}"

FILES_${PN} += "${base_libdir}"
