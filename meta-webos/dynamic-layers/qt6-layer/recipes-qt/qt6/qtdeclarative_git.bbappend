# Copyright (c) 2014-2024 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO:append = "webos87"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

PATCHTOOL = "git"

# Upstream-Status: Backport
SRC_URI:append = " \
    file://0001-Correctly-handle-QQuickState-when.patch;maxver=6.2.3 \
"

# Upstream-Status: Submitted
SRC_URI:append = " \
    file://0001-Check-if-a-device-in-knownPointingDevices-is-destroy.patch;maxver=${WEBOS_PATCH_MAXVER} \
"

# Upstream-Status: Pending
SRC_URI:append = " \
    file://0002-Fix-build-issue-with-uic.patch;minver=6.7.0 \
"

# Upstream-Status: Inappropriate
SRC_URI:append = " \
    file://9901-Revert-Don-t-hide-the-inputMethod-when-finishing-the.patch;maxver=${WEBOS_PATCH_MAXVER} \
"

# Supplement tool for qmllint
inherit webos_qmake6_paths
DEPENDS:append:class-native = " python3-regex-native"
SRC_URI:append:class-native = " file://qmllint-supplement.py"
do_install:append:class-native() {
    install -m 755 ${UNPACKDIR}/qmllint-supplement.py ${D}${OE_QMAKE_PATH_QT_BINS}
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

export CCACHE_MAXSIZE = "1G"

# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/894433
# ERROR: QA Issue: File /usr/src/debug/qtdeclarative/6.7.2/src/quicknativestyle/.qt/rcc/qrc_qtquickcontrols2nativestyleplugin_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quicknativestyle/.qt/rcc/qrc_qmake_QtQuick_NativeStyle.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickshapes/.qt/rcc/qrc_qmake_QtQuick_Shapes.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickshapes/.qt/rcc/qrc_qtquickshapes_shaders.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders7.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders5.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders13.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders25.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders21.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders15.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders1.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders18.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders24.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_effects.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders16.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders11.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders10.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders20.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders6.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders19.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders8.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders17.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders22.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders23.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_qmake_QtQuick_Effects.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders12.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders4.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders3.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders2.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders14.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/effects/.qt/rcc/qrc_multieffect_shaders9.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quicklayouts/.qt/rcc/qrc_qmake_QtQuick_Layouts.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrolstestutils/.qt/rcc/qrc_qmake_Qt_test_controls.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/imports/tooling/.qt/rcc/qrc_quicktooling_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/imports/tooling/.qt/rcc/qrc_qmake_QtQuick_tooling.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmllocalstorage/.qt/rcc/qrc_qmake_QtQuick_LocalStorage.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmltest/.qt/rcc/qrc_qmake_QtTest.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmltest/.qt/rcc/qrc_QuickTest_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_particles_shaders3.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_particles_shaders1.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_qmake_QtQuick_Particles.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_particles_shaders6.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_particles_shaders4.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_particles_shaders5.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_particles.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/particles/.qt/rcc/qrc_particles_shaders2.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickdialogs/quickdialogsquickimpl/.qt/rcc/qrc_QuickDialogs2QuickImpl_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickdialogs/quickdialogsquickimpl/.qt/rcc/qrc_qmake_QtQuick_Dialogs_quickimpl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickdialogs/quickdialogsquickimpl/.qt/rcc/qrc_QuickDialogs2QuickImplShaders.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickdialogs/quickdialogsquickimpl/.qt/rcc/qrc_QuickDialogs2QuickImpl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickdialogs/quickdialogs/.qt/rcc/qrc_qmake_QtQuick_Dialogs.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmlmodels/.qt/rcc/qrc_qmake_QtQml_Models.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmlxmllistmodel/.qt/rcc/qrc_qmake_QtQml_XmlListModel.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmltyperegistrar/.qt/rcc/qrc_jsRootMetaTypes.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quicktemplates/.qt/rcc/qrc_qmake_QtQuick_Templates.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/fusion/.qt/rcc/qrc_QuickControls2Fusion_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/fusion/.qt/rcc/qrc_qtquickcontrols2fusionstyle.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/fusion/.qt/rcc/qrc_qmake_QtQuick_Controls_Fusion.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/fusion/impl/.qt/rcc/qrc_qmake_QtQuick_Controls_Fusion_impl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/fusion/impl/.qt/rcc/qrc_QuickControls2FusionStyleImpl_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/imagine/.qt/rcc/qrc_QuickControls2Imagine_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/imagine/.qt/rcc/qrc_qmake_qtquickcontrols2imaginestyle.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/imagine/.qt/rcc/qrc_qmake_QtQuick_Controls_Imagine.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/imagine/impl/.qt/rcc/qrc_QuickControls2ImagineStyleImpl_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/imagine/impl/.qt/rcc/qrc_qmake_QtQuick_Controls_Imagine_impl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/imagine/impl/.qt/rcc/qrc_qtquickcontrols2imaginestyleimplplugin_shaders.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/basic/.qt/rcc/qrc_qmake_QtQuick_Controls_Basic.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/basic/.qt/rcc/qrc_qtquickcontrols2basicstyle.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/basic/.qt/rcc/qrc_QuickControls2Basic_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/basic/impl/.qt/rcc/qrc_qmake_QtQuick_Controls_Basic_impl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/.qt/rcc/qrc_indirectBasic.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/.qt/rcc/qrc_qmake_QtQuick_Controls.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/material/.qt/rcc/qrc_qtquickcontrols2materialstyle_shaders.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/material/.qt/rcc/qrc_QuickControls2Material_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/material/.qt/rcc/qrc_qtquickcontrols2materialstyle.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/material/.qt/rcc/qrc_qmake_QtQuick_Controls_Material.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/material/impl/.qt/rcc/qrc_qmake_QtQuick_Controls_Material_impl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/material/impl/.qt/rcc/qrc_QuickControls2MaterialStyleImpl_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/universal/.qt/rcc/qrc_qtquickcontrols2universalstyle.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/universal/.qt/rcc/qrc_QuickControls2Universal_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/universal/.qt/rcc/qrc_qmake_QtQuick_Controls_Universal.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/universal/impl/.qt/rcc/qrc_QuickControls2UniversalStyleImpl_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrols/universal/impl/.qt/rcc/qrc_qmake_QtQuick_Controls_Universal_impl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/core/.qt/rcc/qrc_qmake_QtCore.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quickcontrolsimpl/.qt/rcc/qrc_qmake_QtQuick_Controls_impl.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmlnetwork/.qt/rcc/qrc_qmake_QtNetwork.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmlworkerscript/.qt/rcc/qrc_qmake_QtQml_WorkerScript.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qml/.qt/rcc/qrc_qmake_QtQml.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qml/.qt/rcc/qrc_qmlMetaQmldir.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qml/.qt/rcc/qrc_qmake_QtQml_Base.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/window/.qt/rcc/qrc_qmake_QtQuick_Window.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders_lg_derivatives.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders_lg.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_shaders.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders_cg_derivatives.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders_rg.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_qmake_QtQuick.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders_derivatives.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders_rg_derivatives.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/quick/.qt/rcc/qrc_scenegraph_curve_shaders_cg.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/labs/platform/.qt/rcc/qrc_qmake_Qt_labs_platform.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/labs/animation/.qt/rcc/qrc_qmake_Qt_labs_animation.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/labs/wavefrontmesh/.qt/rcc/qrc_qmake_Qt_labs_wavefrontmesh.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/labs/models/.qt/rcc/qrc_qmake_Qt_labs_qmlmodels.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/labs/folderlistmodel/.qt/rcc/qrc_qmake_Qt_labs_folderlistmodel.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/labs/settings/.qt/rcc/qrc_qmake_Qt_labs_settings.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/labs/sharedimage/.qt/rcc/qrc_qmake_Qt_labs_sharedimage.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/src/qmlcompiler/.qt/rcc/qrc_builtins.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/tools/qml/.qt/rcc/qrc_qmake_QmlRuntime_Config.cpp in package qtdeclarative-src contains reference to TMPDIR
# File /usr/src/debug/qtdeclarative/6.7.2/tools/qml/.qt/rcc/qrc_qml_raw_qml_0.cpp in package qtdeclarative-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
