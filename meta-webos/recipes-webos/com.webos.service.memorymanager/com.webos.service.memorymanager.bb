# Copyright (c) 2020-2021 LG Electronics, Inc.

SUMMARY = "Memory Manager"
AUTHOR = "Sangwoo Kang <sangwoo82.kang@lge.com>"
SECTION = "webos/base"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "glib-2.0 luna-service2 libpbnjson pmloglib procps"

WEBOS_VERSION = "1.0.0-48_1c3994e31f4299c76227a78d9236b7dcbf716d8e"
PR = "r5"

inherit webos_component
inherit webos_cmake
inherit webos_enhanced_submissions
inherit webos_daemon
inherit webos_system_bus
inherit webos_machine_dep
inherit webos_machine_impl_dep
inherit webos_distro_dep
inherit webos_distro_variant_dep
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
