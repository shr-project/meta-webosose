# Copyright (c) 2013-2021 LG Electronics, Inc.

SUMMARY = "Remote diagnostics daemon and utilities"
AUTHOR = "Gayathri Srinivasan <gayathri.srinivasan@lge.com>"
SECTION = "base"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
                    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "glib-2.0 libpbnjson luna-prefs luna-service2 pmloglib"
#Add tar dependency since --absolute-names support is missing in busybox tar
RDEPENDS_${PN} = "nyx-utils tar"

WEBOS_VERSION = "4.0.2-15_615c867fa85e3719d8c7305fffcf476b1e372c14"
PR = "r10"

PROVIDES = "librdx rdx-utils"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_daemon
inherit webos_system_bus
inherit webos_library
inherit webos_distro_dep
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

EXTRA_OECMAKE += "-DWEBOS_USE_LEGACY_PACKAGE_MANAGER:BOOL=FALSE"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"

VIRTUAL-RUNTIME_tar ?= "tar"
RDEPENDS_${PN}_append_class-target = " ${VIRTUAL-RUNTIME_tar}"
RDEPENDS_${PN}_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_TAR', 'busybox', 'tar', '', d)}"
