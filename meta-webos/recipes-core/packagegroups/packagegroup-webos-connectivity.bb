# Copyright (c) 2023 LG Electronics, Inc.

DESCRIPTION = "Components for connectivity added to webOS"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

PR = "r0"

inherit packagegroup
inherit features_check

REQUIRED_DISTRO_FEATURES = "webos-connectivity"

RDEPENDS:${PN} = " \
    webos-connman-adapter \
    webos-nettools \
"
