SUMMARY = "IoTivity webapp sample application"
DESCRIPTION = "iotivity webapp sample provides server and client application written in HTML/JavaScript. Server simulates the binary switch resource defined in OCF specification. Client is able to discover and control the server resource."
HOMEPAGE = "https://www.iotivity.org/"
DEPENDS = "boost virtual/gettext chrpath-replacement-native expat openssl util-linux curl glib-2.0 glib-2.0-native"
DEPENDS += "sqlite3 luna-service2 libpbnjson iotivity"
RDEPENDS:${PN} = "iotivity-resource"

SECTION = "webos/apps"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=86d3f3a95c324c9479bd8986968f4327"

SRC_URI = " \
    git://github.com/iotivity/iotivity.git;branch=webos;protocol=https;name=main \
    file://0001-webOS-Apply-new-ACG-policy-in-test-applications.patch \
    file://0001-webOS-Apply-proper-ACG-group-name-in-test-appl.patch \
    file://0001-webOS-Fix-bug-that-API-is-not-called.patch \
"

SRCREV = "ff1837a569494cb9613c3b6c961fcf26f0014515"

S = "${WORKDIR}/git"

PR = "r6"
PV = "1.3.99+git${SRCPV}"

inherit pkgconfig webos_enactjs_app webos_component

WEBOS_ENACTJS_PROJECT_PATH ??= "./resource/csdk/stack/samples/webos/com.example.app.iotivity"
WEBOS_ENACTJS_SHRINKWRAP_OVERRIDE = "false"
WEBOS_ENACTJS_APP_ID = "com.example.app.iotivity"

FILES:${PN} = "\
    ${webos_applicationsdir} \
    ${datadir}/luna-service2 \
"

# iotivity doesn't build for armv[45]*
COMPATIBLE_MACHINE = "(-)"
COMPATIBLE_MACHINE:aarch64 = "(.*)"
COMPATIBLE_MACHINE:armv6 = "(.*)"
COMPATIBLE_MACHINE:armv7a = "(.*)"
COMPATIBLE_MACHINE:armv7ve = "(.*)"
COMPATIBLE_MACHINE:x86 = "(.*)"
COMPATIBLE_MACHINE:x86-64 = "(.*)"

SRC_URI += "file://0001-webOS-Fix-UI-bug-in-iotivity-sampler.patch"
