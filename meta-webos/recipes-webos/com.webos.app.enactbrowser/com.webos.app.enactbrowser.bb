# Copyright (c) 2018-2023 LG Electronics, Inc.

SUMMARY = "Enact Based Web Browser"
AUTHOR = "LUC VAN TRAN <luc2.tran@lge.com>"
SECTION = "webos/apps"
LICENSE = "LicenseRef-EnactBrowser-Evaluation"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=6e00eb832d81f89a0f47fac10db717c7 \
    file://oss-pkg-info.yaml;md5=72b3e3cef46e5ab3e175e5b515dc3b18 \
"

WEBOS_VERSION = "1.0.0-77_4e093d3de628495b43b7a03497c7660469a2d847"
PR = "r19"

inherit webos_public_repo
inherit webos_enhanced_submissions
inherit webos_enactjs_app
inherit webos_filesystem_paths
inherit webos_npm_env

WEBOS_SYSTEM_BUS_SKIP_DO_TASKS = "1"
WEBOS_SYSTEM_BUS_FILES_LOCATION = "${S}/files/sysbus"
WEBOS_SYSTEM_BUS_MANIFEST_TYPE = "PASS"

WEBOS_ENACTJS_PACK_OPTS = "--isomorphic --production --snapshot"
WEBOS_ENACTJS_ILIB_OVERRIDE = ""
WEBOS_PREFERRED_GFX_IMAGE_FORMAT_ENABLED="0"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"
WEBOS_ENACTJS_PROJECT_PATH = "./samples/enact-based"
WEBOS_ENACTJS_PACK_OVERRIDE = "\
    ${ENACT_DEV} pack ${WEBOS_ENACTJS_PACK_OPTS} -o ${D}${webos_applicationsdir}/${WEBOS_ENACTJS_APP_ID} --verbose && \
    ${WEBOS_NODE_BIN} resbundler.js ${D}${webos_applicationsdir}/${WEBOS_ENACTJS_APP_ID} && \
    rm -fr ${D}${webos_applicationsdir}/${WEBOS_ENACTJS_APP_ID}/resources && \
    rm -fr ${D}${webos_applicationsdir}/${WEBOS_ENACTJS_APP_ID}/node_modules/@enact/moonstone/resources && \
    ln -sfn /usr/share/javascript/ilib/localedata/ ${D}${webos_applicationsdir}/${WEBOS_ENACTJS_APP_ID}/ilibdata && \
    cp -R --no-dereference --preserve=mode,links -v webos-locale.js label.js background.js defaults.js manifest.json pdf.js ${D}${webos_applicationsdir}/${WEBOS_ENACTJS_APP_ID}/ && \
    ${WEBOS_NODE_BIN} extract-inline.js ${D}${webos_applicationsdir}/${WEBOS_ENACTJS_APP_ID} \
"

# Remove --production, because that causes
# http://gecko.lge.com/Errors/Details/119724
# Error: Cannot find module 'glob'
WEBOS_NPM_INSTALL_FLAGS = "--arch=${WEBOS_NPM_ARCH} --target_arch=${WEBOS_NPM_ARCH} --without-ssl --insecure --no-optional --verbose"

do_compile:append() {
    ${WEBOS_NPM_BIN} ${WEBOS_NPM_INSTALL_FLAGS} install
    ${WEBOS_NODE_BIN} ./scripts/cli.js transpile
}

install_acg_configuration() {
    # sysbus files *.json
    install -d ${D}${webos_sysbus_permissionsdir}
    install -d ${D}${webos_sysbus_rolesdir}
    install -d ${D}${webos_sysbus_manifestsdir}
    install -v -m 0644 ${WEBOS_SYSTEM_BUS_FILES_LOCATION}/${BPN}.perm.json ${D}${webos_sysbus_permissionsdir}/${BPN}.app.json
    install -v -m 0644 ${WEBOS_SYSTEM_BUS_FILES_LOCATION}/${BPN}.role.json ${D}${webos_sysbus_rolesdir}/${BPN}.app.json
    install -v -m 0644 ${WEBOS_SYSTEM_BUS_FILES_LOCATION}/${BPN}.manifest.json ${D}${webos_sysbus_manifestsdir}/${BPN}.json
}

do_install:append() {
    install_acg_configuration
}

FILES:${PN} += "${webos_applicationsdir}"

# Workaround for network access issue during do_compile task
do_compile[network] = "1"
