# Copyright (c) 2013-2024 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO:append = "webos45"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

PATCHTOOL = "git"

# Upstream-Status: Backport
SRC_URI:append = " \
    file://0001-Support-presentation-time-protocol.patch;maxver=6.2.* \
    file://0002-Use-scope-resolution-operator-for-request.patch;maxver=6.2.* \
    file://0003-Fix-to-have-presentation-feedback-sequence-timely.patch;maxver=6.3.0 \
    file://0004-Fix-Access-nullptr-returned-by-QWaylandSurface-clien.patch;maxver=6.3.0 \
"

# Upstream-Status: Inappropriate
SRC_URI:append = " \
    file://0005-Hotfix-default-seat-grabs-keyboardFocus-from-non-def.patch;minver=6.6.0 \
"

# More options for fine-tuned configuration
PACKAGECONFIG[brcm] = "-DFEATURE_wayland_brcm=ON,-DFEATURE_wayland_brcm=OFF,"
PACKAGECONFIG[drm-egl-server-buffer] = "-DFEATURE_wayland_drm_egl_server_buffer=ON,-DFEATURE_wayland_drm_egl_server_buffer=OFF,"
PACKAGECONFIG[libhybris-egl-server-buffer] = "-DFEATURE_wayland_libhybris_egl_server_buffer=ON,-DFEATURE_wayland_libhybris_egl_server_buffer=OFF,"
PACKAGECONFIG[shm-emulation-server-buffer] = "-DFEATURE_wayland_shm_emulation_server_buffer=ON,-DFEATURE_wayland_shm_emulation_server_buffer=OFF,"
PACKAGECONFIG[vulkan-server-buffer] = "-DFEATURE_wayland_vulkan_server_buffer=ON,-DFEATURE_wayland_vulkan_server_buffer=OFF,"
PACKAGECONFIG[client-fullscreen-shell-v1] = "-DFEATURE_wayland_client_fullscreen_shell_v1=ON,-DFEATURE_wayland_client_fullscreen_shell_v1=OFF,"
PACKAGECONFIG[client-ivi-shell] = "-DFEATURE_wayland_client_ivi_shell=ON,-DFEATURE_wayland_client_ivi_shell=OFF,"
PACKAGECONFIG[client-wl-shell] = "-DFEATURE_wayland_client_wl_shell=ON,-DFEATURE_wayland_client_wl_shell=OFF,"
PACKAGECONFIG[client-xdg-shell] = "-DFEATURE_wayland_client_xdg_shell=ON,-DFEATURE_wayland_client_xdg_shell=OFF,"

# Dropped in the upstream recipe since 6.5.1
PACKAGECONFIG[dmabuf-client-buffer] = "-DFEATURE_wayland_dmabuf_client_buffer=ON,-DFEATURE_wayland_dmabuf_client_buffer=OFF,libdrm"
PACKAGECONFIG[dmabuf-server-buffer] = "-DFEATURE_wayland_dmabuf_server_buffer=ON,-DFEATURE_wayland_dmabuf_server_buffer=OFF,libdrm"

# PACKAGECONFIG for webos
PACKAGECONFIG = "wayland-server wayland-client client-wl-shell dmabuf-client-buffer dmabuf-server-buffer drm-egl-server-buffer"

# qtwayland-qmlplugins is not used in webos
RRECOMMENDS:${PN}:remove = "${PN}-qmlplugins"

# Set QT_SKIP_AUTO_PLUGIN_INCLUSION as otherwise
# QtModulePluginTargets.cmake would complain during
# do_install_ptest_base about missing files that are deleted
# deliberately in do_install:append below.
# See https://codereview.qt-project.org/c/qt/qtbase/+/420212.
EXTRA_OECMAKE:append = " -DQT_SKIP_AUTO_PLUGIN_INCLUSION=ON"

# Set USE_X11/EGL_NO_X11 explicitly for using some eglplatform header.
# http://gecko.lge.com:8000/Errors/Details/750672
TARGET_CFLAGS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '-DUSE_X11', '-DEGL_NO_X11', d)}"

do_install:append() {
    # Remove files unnecessary or conflict with qtwayland-webos
    rm -rf ${D}${QT6_INSTALL_PLUGINSDIR}/platforms \
        ${D}${QT6_INSTALL_PLUGINSDIR}/wayland-decoration-client \
        ${D}${QT6_INSTALL_PLUGINSDIR}/wayland-graphics-integration-client \
        ${D}${QT6_INSTALL_PLUGINSDIR}/wayland-graphics-integration-server/libqt-wayland-compositor-wayland-eglstream-controller.so
}

# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# https://bugreports.qt.io/browse/QTBUG-105913
# http://gecko.lge.com:8000/Errors/Details/894431
# ERROR: QA Issue: File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-scaler.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-qt-text-input-method-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-viewporter.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-text-input-unstable-v2.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-xdg-decoration-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-server-buffer-extension.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-qt-texture-sharing-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-hardware-integration.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-touch-extension.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-xdg-output-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-qt-windowmanager.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-ivi-application.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-presentation-time.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-xdg-shell.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-qt-key-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-wayland.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-text-input-unstable-v3.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandCompositor/6.7.2/QtWaylandCompositor/private/qwayland-server-idle-inhibit-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWlShellIntegration/6.7.2/QtWlShellIntegration/private/qwayland-wayland.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-fractional-scale-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-server-buffer-extension.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-wp-primary-selection-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-viewporter.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-qt-windowmanager.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-tablet-unstable-v2.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-touch-extension.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-qt-text-input-method-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-xdg-toplevel-drag-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-pointer-gestures-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-hardware-integration.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-surface-extension.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-text-input-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-text-input-unstable-v3.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-xdg-shell.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-xdg-output-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-qt-key-unstable-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-wayland.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-cursor-shape-v1.h in package qtwayland-dev contains reference to TMPDIR
# File /usr/include/QtWaylandClient/6.7.2/QtWaylandClient/private/qwayland-text-input-unstable-v2.h in package qtwayland-dev contains reference to TMPDIR [buildpaths]
# ERROR: QA Issue: File /usr/src/debug/qtwayland/6.7.2/src/imports/texture-sharing/qwayland-qt-texture-sharing-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/texture-sharing/qwayland-qt-texture-sharing-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/texture-sharing/.qt/rcc/qrc_qmake_QtWayland_Client_TextureSharing.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/texture-sharing-extension/.qt/rcc/qrc_qmake_QtWayland_Compositor_TextureSharingExtension.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/compositor-extensions/iviapplication/.qt/rcc/qrc_qmake_QtWayland_Compositor_IviApplication.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/compositor-extensions/qtshell/qwayland-server-qt-shell-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/compositor-extensions/qtshell/qwayland-server-qt-shell-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/compositor-extensions/qtshell/.qt/rcc/qrc_qmake_QtWayland_Compositor_QtShell.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/compositor-extensions/xdgshell/.qt/rcc/qrc_qmake_QtWayland_Compositor_XdgShell.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/compositor-extensions/wlshell/.qt/rcc/qrc_qmake_QtWayland_Compositor_WlShell.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/imports/compositor-extensions/presentationtime/.qt/rcc/qrc_qmake_QtWayland_Compositor_PresentationTime.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/hardwareintegration/compositor/dmabuf-server/qwayland-server-qt-dmabuf-server-buffer.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/hardwareintegration/compositor/dmabuf-server/qwayland-server-qt-dmabuf-server-buffer.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/hardwareintegration/compositor/drm-egl-server/qwayland-server-drm-egl-server-buffer.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/hardwareintegration/compositor/drm-egl-server/qwayland-server-drm-egl-server-buffer.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/hardwareintegration/compositor/linux-dmabuf-unstable-v1/qwayland-server-linux-dmabuf-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/hardwareintegration/compositor/linux-dmabuf-unstable-v1/qwayland-server-linux-dmabuf-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/shellintegration/wl-shell/qwayland-wayland.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/shellintegration/wl-shell/qwayland-wayland.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/shellintegration/qt-shell/qwayland-qt-shell-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/plugins/shellintegration/qt-shell/qwayland-qt-shell-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-fractional-scale-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-server-buffer-extension.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-wp-primary-selection-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-viewporter.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-xdg-toplevel-drag-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-qt-windowmanager.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-text-input-unstable-v3.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-qt-windowmanager.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-tablet-unstable-v2.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-pointer-gestures-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-text-input-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-cursor-shape-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-touch-extension.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-hardware-integration.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-qt-text-input-method-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-xdg-toplevel-drag-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-pointer-gestures-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-surface-extension.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-wp-primary-selection-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-touch-extension.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-hardware-integration.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-tablet-unstable-v2.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-surface-extension.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-xdg-output-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-text-input-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-server-buffer-extension.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-text-input-unstable-v3.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-qt-key-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-viewporter.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-xdg-shell.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-xdg-output-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-qt-key-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-fractional-scale-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-wayland.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-xdg-shell.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-text-input-unstable-v2.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-cursor-shape-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-qt-text-input-method-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-wayland.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/client/qwayland-text-input-unstable-v2.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-presentation-time.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-scaler.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-ivi-application.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-text-input-method-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-viewporter.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-key-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-text-input-unstable-v2.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-windowmanager.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-xdg-decoration-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-server-buffer-extension.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-texture-sharing-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-viewporter.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-hardware-integration.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-xdg-shell.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-touch-extension.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-touch-extension.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-server-buffer-extension.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-text-input-unstable-v2.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-xdg-output-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-xdg-decoration-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-text-input-method-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-windowmanager.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-hardware-integration.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-idle-inhibit-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-ivi-application.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-wayland.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-presentation-time.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-xdg-shell.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-xdg-output-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-scaler.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-key-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-wayland.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-qt-texture-sharing-unstable-v1.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-text-input-unstable-v3.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-idle-inhibit-unstable-v1.h in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/qwayland-server-text-input-unstable-v3.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/.qt/rcc/qrc_compositor.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/.qt/rcc/qrc_qmake_QtWayland_Compositor.cpp in package qtwayland-src contains reference to TMPDIR
# File /usr/src/debug/qtwayland/6.7.2/src/compositor/.qt/rcc/qrc_WaylandCompositor_raw_qml_0.cpp in package qtwayland-src contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
