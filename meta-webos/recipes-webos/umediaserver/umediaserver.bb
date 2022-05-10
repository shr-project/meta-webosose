# Copyright (c) 2013-2022 LG Electronics, Inc.

SUMMARY = "webOS uMediaserver daemon and utilities"
AUTHOR = "Ian Cain <ian.cain@lge.com>"
SECTION = "webos/base"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
  file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
  file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "glib-2.0 libpbnjson libconfig swig-native libxml2 luna-service2 pmloglib boost luna-prefs"
DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base"
DEPENDS += "${@'' if '${WEBOS_DISTRO_PRERELEASE}' == '' else 'pmtrace'}"
RDEPENDS:${PN} = "umediaserver-configs"

PR = "r19"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_library
inherit webos_daemon
inherit webos_system_bus
inherit webos_machine_dep
inherit python3-dir
inherit python3native
inherit webos_public_repo
inherit webos_prerelease_dep

do_configure:prepend() {
    sed -i 's@add_subdirectory(test/python)@#disabled until updated to work with python3 add_subdirectory(test/python)@g' ${S}/CMakeLists.txt
}

# umediaserver doesn't build for armv[45]*
COMPATIBLE_MACHINE = "(-)"
COMPATIBLE_MACHINE:aarch64 = "(.*)"
COMPATIBLE_MACHINE:armv6 = "(.*)"
COMPATIBLE_MACHINE:armv7a = "(.*)"
COMPATIBLE_MACHINE:armv7ve = "(.*)"
COMPATIBLE_MACHINE:x86 = "(.*)"
COMPATIBLE_MACHINE:x86-64 = "(.*)"

WEBOS_GIT_PARAM_BRANCH = "@gav"
WEBOS_VERSION = "1.0.0-24.gav.21_568cdc04e1ba1f3b99267a32dc4adfb9dac43edc"

WEBOS_GIT_PARAM_BRANCH:raspberrypi3 = "master"
WEBOS_VERSION:raspberrypi3 = "1.0.0-27_dad33357ba323a69885bc11661330ab07296b0c8"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

PACKAGECONFIG = "com.webos.service.videooutput"
PACKAGECONFIG[com.webos.service.videooutput] = "-DUSE_VIDEOOUTPUTD:BOOL=TRUE,-DUSE_VIDEOOUTPUTD:BOOL=FALSE,,com.webos.service.videooutput"

# umediaserver-python contains the Python bindings
PACKAGES =+ "${PN}-python"

FILES:${PN}-python = "${libdir}/${PYTHON_DIR}/site-packages/uMediaServer/* ${datadir}/${BPN}/python/"

# needs to be fixed first
# http://caprica.lgsvl.com:8080/Errors/Details/1092075
# 1.0.0-184.open.10-r10/git/src/logger/Logger_macro.h:186:38: error: format not a string literal and no format arguments [-Werror=format-security]
#   char message[MAX_FT_SIZE]; snprintf(message, MAX_FT_SIZE, format, args...);
#                              ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
SECURITY_STRINGFORMAT = ""

SRC_URI += "file://0001-waitForStop-API-is-added-for-cleanup-message-handler.patch"

#Remove videooutputd from OSE
PACKAGECONFIG:remove:raspberrypi4 = "com.webos.service.videooutput"
