# Copyright (c) 2013-2021 LG Electronics, Inc.

inherit webos_qt_global

EXTENDPRAUTO_append = "webos89"

# Remove LGPL3-only files
python do_patch_append() {
    bb.build.exec_func('remove_LGPL3', d)
}

remove_LGPL3() {
    rm -vf ${S}/src/plugins/platforms/andr*oid/extract.cpp
}

# Disable features we don't use in all webOS products
PACKAGECONFIG_DEFAULT_remove = "dbus"

# Enable accessibility for qtquickcontrols
PACKAGECONFIG_append = " accessibility"

# Disable widget features
PACKAGECONFIG_remove = "widgets"

# Configure to use platform harfbuzz
PACKAGECONFIG_append = " harfbuzz"

# Configure to compile with GL ES2 instead of default desktop GL
PACKAGECONFIG_GL = "gles2"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG_append = " icu"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG_append = " glib"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG_append = " fontconfig"
# We had this enabled in our old gpro/meta-qt5 recipe
PACKAGECONFIG_append = " sql-sqlite"
# No longer added automatically
PACKAGECONFIG[gif] = "-DFEATURE_gif=ON,-DFEATURE_gif=OFF"
PACKAGECONFIG_append = " gif"
# Needed since qtwayland 5.12
PACKAGECONFIG_append_class-target = " xkbcommon"
# Disable loading text in image metadata
PACKAGECONFIG[no-imageio-text-loading] = "-DFEATURE_imageio_text_loading=OFF,-DFEATURE_imageio_text_loading=ON"
PACKAGECONFIG_append = " no-imageio-text-loading"

PACKAGECONFIG[linuxfb] = "-DFEATURE_linuxfb=ON,-DFEATURE_linuxfb=OFF"
PACKAGECONFIG_remove = "linuxfb"

PACKAGECONFIG[ico] = "-DFEATURE_ico=ON,-DFEATURE_ico=OFF"
PACKAGECONFIG_remove = "ico"

PACKAGECONFIG[sessionmanager] = "-DFEATURE_sessionmanager=ON,-DFEATURE_sessionmanager=OFF"
PACKAGECONFIG_remove = "sessionmanager"

PACKAGECONFIG[xlib] = "-DFEATURE_xlib=ON,-DFEATURE_xlib=OFF"
PACKAGECONFIG_remove = "xlib"

PACKAGECONFIG[eglfs-egldevice] = "-DFEATURE_eglfs_egldevice=ON,-DFEATURE_eglfs_egldevice=OFF"
PACKAGECONFIG_remove = "eglfs-egldevice"

PACKAGECONFIG[system-sqlite] = "-DFEATURE_system_sqlite=ON,-DFEATURE_system_sqlite=OFF"
PACKAGECONFIG_append = " system-sqlite"

PACKAGECONFIG[system-pcre2] = "-DFEATURE_system_pcre2=ON,-DFEATURE_system_pcre2=OFF"
PACKAGECONFIG_remove = "system-pcre2"

PACKAGECONFIG_remove = "libinput"

PACKAGECONFIG_append = " kms"

# Depending on whether LTTNG support is enabled or not for the build we need to
# depend on the LTTNG providers to not let the build fail
inherit webos_lttng
# Disable lttng until wam eliminates dependency to qtbase (See PLAT-139794 for details)
#PACKAGECONFIG_append = "${@ ' lttng' if '${WEBOS_LTTNG_ENABLED}' == '1' else '' }"

# Do not build tests/ in webos
PACKAGECONFIG_remove = "tests"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# Upstream-Status: Backport
SRC_URI_append = " \
    file://0001-Fix-binding-functor-addressing-in-QProperty.patch \
"

# Upstream-Status: Pending (Please upstream this)
SRC_URI_append = " \
    file://0001-catch_p_p.h-don-t-use-MINSIGSTKSZ.patch \
"

# Upstream-Status: Inappropriate
SRC_URI_append = " \
    file://9901-Disable-Faux-bolding-in-Qts-FreeType-FontEngine.patch \
"

# TODO: qtbase-native fails to build with g++ from hosttools(7.5.0)
# Drop this once our build host has a newer version of g++.
SRC_URI_append_class-native = " \
    file://0001-Fix-compile-error-with-g-7.5.0.patch \
"

# Flags needed for webOS
TARGET_CXXFLAGS_append = " \
    -DQFONTCACHE_MIN_COST=512 \
"

VIRTUAL-RUNTIME_gpu-libs ?= ""
RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_gpu-libs}"
