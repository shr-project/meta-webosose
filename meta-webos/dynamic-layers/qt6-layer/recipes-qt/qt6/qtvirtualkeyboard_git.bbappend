
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/895282
# ERROR: QA Issue: File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/virtualkeyboard/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/virtualkeyboard/.qt/rcc/qrc_VirtualKeyboard_raw_qml_0.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/pinyin/.qt/rcc/qrc_qmake_virtualkeyboard_pinyin_layouts.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/pinyin/.qt/rcc/qrc_qmake_pinyin.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/pinyin/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Plugins_Pinyin.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/tcime/.qt/rcc/qrc_qmake_virtualkeyboard_tcime_layouts.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/tcime/.qt/rcc/qrc_qmake_tcime.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/tcime/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Plugins_TCIme.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/openwnn/.qt/rcc/qrc_qmake_virtualkeyboard_openwnn_layouts.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/openwnn/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Plugins_OpenWNN.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/hangul/.qt/rcc/qrc_qmake_virtualkeyboard_hangul_layouts.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/hangul/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Plugins_Hangul.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Plugins.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/thai/.qt/rcc/qrc_qmake_virtualkeyboard_thai_layouts.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/plugins/thai/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Plugins_Thai.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/components/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Components.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/components/.qt/rcc/qrc_qtvkbcomponentsplugin_raw_qml_0.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/styles/builtin/.qt/rcc/qrc_virtualkeyboard_default_style.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/styles/builtin/.qt/rcc/qrc_virtualkeyboard_retro_style.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/styles/builtin/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Styles_Builtin.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/styles/.qt/rcc/qrc_qtvkbstylesplugin_raw_qml_0.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/styles/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Styles.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/settings/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Settings.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/layouts/.qt/rcc/qrc_qmake_virtualkeyboard_layouts.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR
# File /usr/src/debug/qtvirtualkeyboard/6.7.2/src/layouts/.qt/rcc/qrc_qmake_QtQuick_VirtualKeyboard_Layouts.cpp in package qtvirtualkeyboard-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
