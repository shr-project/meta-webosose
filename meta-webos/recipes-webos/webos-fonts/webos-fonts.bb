# Copyright (c) 2017-2018 LG Electronics, Inc.

require ${BPN}.inc

WEBOS_VERSION = "1.0.0-3_675fb2f477b0b0504e655fedd3efd0c9e41d27bf"
PR = "r0"

inherit webos_arch_indep
inherit webos_enhanced_submissions
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

do_install() {
    install -d ${D}${datadir}/fonts
    install -v -m 644 Miso/*.ttf ${D}${datadir}/fonts
    install -v -m 644 Museo/*.ttf ${D}${datadir}/fonts
    install -v -m 644 NotoSans/*.ttf NotoSans/*.otf ${D}${datadir}/fonts
}
