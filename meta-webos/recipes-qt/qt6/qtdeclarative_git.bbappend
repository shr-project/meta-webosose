# Copyright (c) 2014-2021 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO:append = "webos65"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Upstream-Status: Backport, Submitted
SRC_URI:append:class-target = " \
    file://0001-Check-if-a-device-in-knownPointingDevices-is-destroy.patch \
"

# Upstream-Status: Inappropriate
SRC_URI:append = " \
    file://0001-Revert-use-boolean-for-when-property.patch \
    file://0002-Revert-Don-t-hide-the-inputMethod-when-finishing-the.patch \
"

# Needed to workaround qmllint error
SRC_URI:append:class-native = " \
    file://0001-Allow-warnings-from-qmllint.patch \
"

# TODO: It causes crash in webos emulator build (QTBUG-93890)
SRC_URI:append:qemux86:class-target = " \
    file://0001-Revert-QQuickItem-Make-x-y-width-height-bindable.patch \
"

# Supplement tool for qmllint
inherit webos_qmake6_paths
DEPENDS:append:class-native = " python3-regex-native"
SRC_URI:append:class-native = " file://qmllint-supplement.py"
do_install:append:class-native() {
    install -m 755 ${WORKDIR}/qmllint-supplement.py ${D}${OE_QMAKE_PATH_QT_BINS}
}
