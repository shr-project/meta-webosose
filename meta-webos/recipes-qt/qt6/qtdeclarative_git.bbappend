# Copyright (c) 2014-2021 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO:append = "webos75"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Apply webOS specific patches to only SRCREV tested
WEBOS_PATCH_SRCREV = "00c352c4d4b61f8c7a6243768bc5375c3dca3e76"
PATCHTOOL = "git"

# Upstream-Status: Backport, Submitted
SRC_URI:append:class-target = " \
    file://0001-Check-if-a-device-in-knownPointingDevices-is-destroy.patch;rev=${WEBOS_PATCH_SRCREV} \
"

# Upstream-Status: Inappropriate
SRC_URI:append = " \
    file://0001-Revert-use-boolean-for-when-property.patch;rev=${WEBOS_PATCH_SRCREV} \
    file://0002-Revert-Don-t-hide-the-inputMethod-when-finishing-the.patch;rev=${WEBOS_PATCH_SRCREV} \
"

# Supplement tool for qmllint
inherit webos_qmake6_paths
DEPENDS:append:class-native = " python3-regex-native"
SRC_URI:append:class-native = " file://qmllint-supplement.py"
do_install:append:class-native() {
    install -m 755 ${WORKDIR}/qmllint-supplement.py ${D}${OE_QMAKE_PATH_QT_BINS}
}

# TODO: To workaround the build issue where a recipe that depends on
# qtdeclarative fails at do_configure with CMake errors like:
# The imported target "Qt6::qmltyperegistrar" references the file
# ".../recipe-sysroot/usr/libexec/qmltyperegistrar"
# The imported target "Qt6::qmldom" references the file
# ".../recipe-sysroot/usr/bin/qmldom"
SYSROOT_DIRS:append = " \
    ${bindir} \
    ${libexecdir} \
"
