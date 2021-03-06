# Copyright (c) 2014-2021 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO_append = "webos65"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# Upstream-Status: Backport, Submitted
SRC_URI_append_class-target = " \
    file://0001-Check-if-a-device-in-knownPointingDevices-is-destroy.patch \
"

# Upstream-Status: Inappropriate
SRC_URI_append = " \
    file://0001-Revert-use-boolean-for-when-property.patch \
    file://0002-Revert-Don-t-hide-the-inputMethod-when-finishing-the.patch \
"

# Needed to workaround qmllint error
SRC_URI_append_class-native = " \
    file://0001-Allow-warnings-from-qmllint.patch \
"

# TODO: It causes crash in webos emulator build (QTBUG-93890)
SRC_URI_append_qemux86_class-target = " \
    file://0001-Revert-QQuickItem-Make-x-y-width-height-bindable.patch \
"

# Supplement tool for qmllint
inherit webos_qmake6_paths
DEPENDS_append_class-native = " python3-regex-native"
SRC_URI_append_class-native = " file://qmllint-supplement.py"
do_install_append_class-native() {
    install -m 755 ${WORKDIR}/qmllint-supplement.py ${D}${OE_QMAKE_PATH_QT_BINS}
}
