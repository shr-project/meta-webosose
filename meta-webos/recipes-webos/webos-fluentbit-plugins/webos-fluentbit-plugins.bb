# Copyright (c) 2021-2023 LG Electronics, Inc.

SUMMARY = "webOS fluentbit plugins"
AUTHOR = "Sangwoo Kang <sangwoo82.kang@lge.com>"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "glib-2.0 luna-service2 libpbnjson fluentbit msgpack-c"
RDEPENDS:${PN} = "nyx-utils python3-core python3-requests python3-atlassian-python-api"

WEBOS_VERSION = "1.0.0-39_988d3fb8f8df022bb1f15f14606fa2fae663d124"
PR = "r13"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_pkgconfig
inherit webos_cmake
inherit webos_system_bus
inherit webos_public_repo
inherit webos_machine_dep
inherit webos_distro_dep
inherit webos_distro_variant_dep

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE} \
    file://0001-input_simulator-fix-build-with-64-bit-time_t.patch \
"

S = "${WORKDIR}/git"
