# Copyright (c) 2013-2021 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO:append = "webos92"

# Remove LGPL3-only files
python do_patch:append() {
    bb.build.exec_func('remove_LGPL3', d)
}

remove_LGPL3() {
    rm -vf ${S}/src/plugins/platforms/andr*oid/extract.cpp
}

# Disable features we don't use in all webOS products
PACKAGECONFIG_DEFAULT:remove = "dbus"

# Enable accessibility for qtquickcontrols
PACKAGECONFIG:append = " accessibility"

# Disable widget features
PACKAGECONFIG:remove = "widgets"

# Configure to use platform harfbuzz
PACKAGECONFIG:append = " harfbuzz"

# Configure to compile with GL ES2 instead of default desktop GL
PACKAGECONFIG_GL = "gles2"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG:append = " icu"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG:append = " glib"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG:append = " fontconfig"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG:append = " sql-sqlite"
# No longer added automatically
PACKAGECONFIG[gif] = "-DFEATURE_gif=ON,-DFEATURE_gif=OFF"
PACKAGECONFIG:append = " gif"
# Needed since qtwayland 5.12
PACKAGECONFIG:append:class-target = " xkbcommon"
# Disable loading text in image metadata
PACKAGECONFIG[no-imageio-text-loading] = "-DFEATURE_imageio_text_loading=OFF,-DFEATURE_imageio_text_loading=ON"
PACKAGECONFIG:append = " no-imageio-text-loading"

PACKAGECONFIG[linuxfb] = "-DFEATURE_linuxfb=ON,-DFEATURE_linuxfb=OFF"
PACKAGECONFIG:remove = "linuxfb"

PACKAGECONFIG[ico] = "-DFEATURE_ico=ON,-DFEATURE_ico=OFF"
PACKAGECONFIG:remove = "ico"

PACKAGECONFIG[sessionmanager] = "-DFEATURE_sessionmanager=ON,-DFEATURE_sessionmanager=OFF"
PACKAGECONFIG:remove = "sessionmanager"

PACKAGECONFIG[xlib] = "-DFEATURE_xlib=ON,-DFEATURE_xlib=OFF"
PACKAGECONFIG:remove = "xlib"

PACKAGECONFIG[eglfs-egldevice] = "-DFEATURE_eglfs_egldevice=ON,-DFEATURE_eglfs_egldevice=OFF"
PACKAGECONFIG:remove = "eglfs-egldevice"

PACKAGECONFIG[system-sqlite] = "-DFEATURE_system_sqlite=ON,-DFEATURE_system_sqlite=OFF"
PACKAGECONFIG:append = " system-sqlite"

PACKAGECONFIG[system-pcre2] = "-DFEATURE_system_pcre2=ON,-DFEATURE_system_pcre2=OFF"
PACKAGECONFIG:remove = "system-pcre2"

PACKAGECONFIG:remove = "libinput"

PACKAGECONFIG:append = " kms"

# Depending on whether LTTNG support is enabled or not for the build we need to
# depend on the LTTNG providers to not let the build fail
inherit webos_lttng
# Disable lttng until wam eliminates dependency to qtbase (See PLAT-139794 for details)
#PACKAGECONFIG:append = "${@ ' lttng' if '${WEBOS_LTTNG_ENABLED}' == '1' else '' }"

# Do not build tests/ in webos
PACKAGECONFIG:remove = "tests"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

# Upstream-Status: Backport [8f984c5ee624cb0b6f1b9fdfec8c1f8da8a443ca]
SRC_URI:append = " \
    file://0001-Revert-CMake-Warn-if-cmake_minimum_required-has-an-u.patch \
"
# Upstream-Status: Inappropriate
SRC_URI:append = " \
    file://9901-Disable-Faux-bolding-in-Qts-FreeType-FontEngine.patch \
"

# TODO: qtbase-native fails to build with g++ from hosttools(7.5.0)
# Drop this once our build host has a newer version of g++.
SRC_URI:append:class-native = " \
    file://0001-Fix-compile-error-with-g-7.5.0.patch \
"

# Flags needed for webOS
TARGET_CXXFLAGS:append = " \
    -DQFONTCACHE_MIN_COST=512 \
"

VIRTUAL-RUNTIME_gpu-libs ?= ""
RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_gpu-libs}"
