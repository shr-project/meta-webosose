# Copyright (c) 2017-2024 LG Electronics, Inc.

SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

WEBOS_VERSION = "1.0.0-24_cd308777c02ba5a086ce48e0cc1c95720f9d80d2"
INC_PR = "r6"

EXTRA_INHERIT ?= "webos_arch_indep webos_cmake"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_app
inherit webos_public_repo
inherit ${EXTRA_INHERIT}

WEBOS_REPO_NAME = "test-apps"
SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git/${BPN}"

FILES:${PN} += "${webos_applicationsdir}"
