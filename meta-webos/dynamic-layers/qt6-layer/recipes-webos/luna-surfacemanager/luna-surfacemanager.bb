# Copyright (c) 2013-2024 LG Electronics, Inc.

SUMMARY = "The core of the Luna Surface Manager (compositor)"
AUTHOR = "Elvis Lee <kwangwoong.lee@lge.com>"
SECTION = "webos/libs"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=2c7c706c6a586a6abec428c64006d86b \
"

DEPENDS = "qtdeclarative wayland-native qtwayland qtwayland-native qt-features-webos pmloglib webos-wayland-extensions glib-2.0 qtwayland-webos"

WEBOS_VERSION = "2.0.0-414_19ece2134d7a6c1244edd9e283798fa95b9a4ee6"
PR = "r62"

inherit webos_qmake6
inherit webos_pkgconfig
inherit webos_enhanced_submissions
inherit webos_lttng
inherit webos_public_repo
inherit features_check
ANY_OF_DISTRO_FEATURES = "vulkan opengl"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"

S = "${WORKDIR}/git"

inherit webos_systemd
WEBOS_SYSTEMD_SERVICE = "lsm-ready.path lsm-ready.service lsm-ready.target surface-manager.service surface-manager-daemon.service"

OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"

# Enable LTTng tracing capability when enabled in webos_lttng class
EXTRA_QMAKEVARS_PRE += "${@ 'CONFIG+=lttng' if '${WEBOS_LTTNG_ENABLED}' == '1' else '' }"

EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"

# We don't support configuring via cmake
EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"

FILES:${PN}-dev += " \
    ${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/* \
    ${OE_QMAKE_PATH_LIBS}/*.prl \
"

do_install:append() {
    sed -i 's@prefix=${STAGING_DIR_HOST}@prefix=@g;s@-L${STAGING_DIR_HOST} @ @g;' ${D}${libdir}/pkgconfig/*.pc
    sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgconfig/*.pc
    if ${@bb.utils.contains('PACKAGECONFIG', 'compositor', 'true', 'false', d)}; then
        install -d ${D}${datadir}/webos-keymap
        ${STAGING_DIR_NATIVE}${OE_QMAKE_PATH_QT_BINS}/generate_qmap ${D}${datadir}/webos-keymap/webos-keymap.qmap
    fi

    if ${@bb.utils.contains('IMAGE_FEATURES', 'webos-test', 'true', 'false', d)}; then
        mkdir -p ${D}${libdir}/${BPN}
        find ${B} -name \*.gcno -exec cp -t ${D}${libdir}/${BPN} {} \;
    fi
}

TARGET_CXXFLAGS:append = " ${@bb.utils.contains('IMAGE_FEATURES', 'webos-test', '--coverage -fprofile-dir=/tmp/luna-surfacemanager-gcov -O0', '', d)}"
TARGET_LDFLAGS:append = " ${@bb.utils.contains('IMAGE_FEATURES', 'webos-test', '--coverage', '', d)}"
# ld.lld: error: version script assignment of 'Qt_6.7' to symbol 'qt_version_tag' failed: symbol not defined
# http://gecko.lge.com:8000/Errors/Details/887026
# fatal since --no-undefined-version is the default since https://reviews.llvm.org/D135402
TARGET_LDFLAGS:append = " -Wl,--undefined-version"

VIRTUAL-RUNTIME_gpu-libs ?= ""
RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_gpu-libs}"

# Select platform abstraction plugin
VIRTUAL-RUNTIME_lsm-qpa ?= ""
RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_lsm-qpa}"

inherit webos_system_bus
inherit webos_qmllint

# qt-features-webos have its own logic to install system bus files reason for
# that is because only qmake knows where substitued files will be placed.
WEBOS_SYSTEM_BUS_SKIP_DO_TASKS = "1"

# Perform extra QML validation
WEBOS_QMLLINT_EXTRA_VALIDATION = "1"

PACKAGECONFIG[compositor] = "CONFIG+=compositor_base,,qt-features-webos-native"
PACKAGECONFIG[multi-input] = ",CONFIG+=no_multi_input,"
PACKAGECONFIG[cursor-theme] = "CONFIG+=cursor_theme,,"

PACKAGECONFIG = "compositor cursor-theme"

PACKAGE_BEFORE_PN = "${PN}-gcov"

FILES:${PN}-gcov = " \
    ${libdir}/${BPN}/*.gcno \
"

PACKAGES =+ "${PN}-conf ${PN}-base ${PN}-base-tests"

FILES:${PN}-conf += " \
    ${sysconfdir}/surface-manager.d/ \
    ${webos_sysbus_apipermissionsdir} \
    ${webos_sysbus_groupsdir} \
    ${webos_sysbus_servicedir} \
    ${webos_sysbus_manifestsdir}/luna-surfacemanager.manifest.json \
    ${webos_sysbus_permissionsdir}/com.webos.surfacemanager.perm.json \
    ${webos_sysbus_rolesdir}/com.webos.surfacemanager.role.json \
"

FILES:${PN}-base += " \
    ${OE_QMAKE_PATH_QML}/WebOSCompositorBase/ \
    ${OE_QMAKE_PATH_QML}/WebOSCompositor/ \
    ${OE_QMAKE_PATH_BINS}/ \
    ${datadir}/icons/ \
    ${datadir}/webos-keymap/webos-keymap.qmap \
"

FILES:${PN}-base-tests += " \
    ${webos_applicationsdir}/ \
    ${webos_sysbus_manifestsdir}/ \
    ${webos_sysbus_permissionsdir}/ \
    ${webos_sysbus_rolesdir}/ \
    ${webos_testsdir}/${BPN}/ \
"

RDEPENDS:${PN}-base += "xkeyboard-config qml-webos-framework qml-webos-bridge qml-webos-components qtdeclarative-qmlplugins"

# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/894442
# ERROR: QA Issue: File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-input-manager.h in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-foreign.h in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-input-manager.cpp in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-tablet.cpp in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-tablet.h in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-foreign.cpp in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-surface-group.h in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/modules/weboscompositor/qwayland-server-webos-surface-group.cpp in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/base/utils/screen-tester/.rcc/qrc_qmake_qmake_immediate.cpp in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/base/tests/native/frame_latency_test/.rcc/qrc_resources.cpp in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/base/tests/native/touch_latency_test/.rcc/qrc_resources.cpp in package luna-surfacemanager-src contains reference to TMPDIR
# File /usr/src/debug/luna-surfacemanager/2.0.0-405/base/tests/native/tablet_event_test/.rcc/qrc_tablet_event_test.cpp in package luna-surfacemanager-src contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/lib/libWebOSCoreCompositor.prl in package luna-surfacemanager-dev contains reference to TMPDIR
# File /usr/include/WebOSCoreCompositor/0.0.1/WebOSCoreCompositor/private/qwayland-server-webos-input-manager.h in package luna-surfacemanager-dev contains reference to TMPDIR
# File /usr/include/WebOSCoreCompositor/0.0.1/WebOSCoreCompositor/private/qwayland-server-webos-foreign.h in package luna-surfacemanager-dev contains reference to TMPDIR
# File /usr/include/WebOSCoreCompositor/0.0.1/WebOSCoreCompositor/private/qwayland-server-webos-tablet.h in package luna-surfacemanager-dev contains reference to TMPDIR
# File /usr/include/WebOSCoreCompositor/0.0.1/WebOSCoreCompositor/private/qwayland-server-webos-surface-group.h in package luna-surfacemanager-dev contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
