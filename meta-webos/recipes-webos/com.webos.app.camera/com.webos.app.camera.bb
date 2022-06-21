# Copyright (c) 2021-2022 LG Electronics, Inc.

SUMMARY = "Camera application"
AUTHOR = "Muniraju <muniraju.a@lge.com>"
SECTION = "webos/apps"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
    file://oss-pkg-info.yaml;md5=3072ffcf5bdbbc376ed21c9d378d14d5 \
"

WEBOS_VERSION = "0.0.1-8_8939a2009fb96bb16236b59c95da3b14893c8c13"
PR = "r0"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_enactjs_app
inherit webos_public_repo

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

WEBOS_ENACTJS_APP_ID = "com.webos.app.camera"
WEBOS_ENACTJS_SHRINKWRAP_OVERRIDE = "false"

# Workaround for network access issue during do_compile task
do_compile[network] = "1"

do_install:prepend() {
    export NODE_OPTIONS="--openssl-legacy-provider"
    # work around nodejs trying to load openssl's legacy.so from openssl WORKDIR which might be already removed by rm-work
    # see https://lists.openembedded.org/g/openembedded-devel/message/96799
    export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules/"
}
