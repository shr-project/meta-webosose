# Copyright (c) 2023-2025 LG Electronics, Inc.

inherit webos_cmake_qt6

FILES:${PN}-dev += " \
    ${QT6_INSTALL_DESCRIPTIONSDIR} \
    ${QT6_INSTALL_LIBDIR}/cmake/* \
    ${QT6_INSTALL_LIBDIR}/metatypes/* \
    ${QT6_INSTALL_LIBDIR}/sbom/* \
"

# http://gpro.lge.com/c/webosose/qtwayland-webos/+/349070 Use QtWebOSEglClientBuffer for cmake]
# Does it have to be applied only for CMake build?
SRC_URI:append = "\
    file://0001-Use-QtWebOSEglClientBuffer-for-cmake.patch \
"

PACKAGECONFIG[criu] = "-DFEATURE_criu=ON,-DFEATURE_criu=OFF,criu-webos"
PACKAGECONFIG[lttng] = "-DFEATURE_lttng=ON,-DFEATURE_lttng=OFF,"

# http://gecko.lge.com:8000/Errors/Details/1006605
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:34:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:40:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:48:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:54:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:63:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:68:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:78:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:83:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:93:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# qtwayland-webos/6.0.0-93/git/src/plugins/platforms/webos-wayland-egl/./pmtrace_qtwaylandwebos_provider.h:98:1: sorry, unimplemented: __builtin_clear_padding not supported for variable length aggregates
# -ftrivial-auto-var-init=pattern enabled by default since 6.8.0 with:
# recipe-sysroot/usr/lib/cmake/Qt6/Qt6Targets.cmake:  INTERFACE_COMPILE_OPTIONS "\$<\$<OR:\$<NOT:\$<CONFIG:Debug>>,\$<BOOL:OFF>>:-U_FORTIFY_SOURCE>;\$<\$<COMPILE_LANGUAGE:CXX>:-Wsuggest-override>;\$<\$<OR:\$<NOT:\$<CONFIG:Debug>>,\$<BOOL:OFF>>:-D_FORTIFY_SOURCE=3>;-ftrivial-auto-var-init=pattern;-fstack-protector-strong;-fstack-clash-protection"
# it fails only with styhead and newer, because it's enabled only with gcc-14.2 and newer, see:
# https://codereview.qt-project.org/c/qt/qtbase/+/578914
# ugly hack just to see if it fixes the build, we need to figure out better way how to disable this if needed,
# because adding -ftrivial-auto-var-init=uninitialized to CXXFLAGS/CXX will end in cmdline before
# -ftrivial-auto-var-init=pattern from Qt6Targets.cmake and the pattern wins and it still fails
# CXXFLAGS += "-ftrivial-auto-var-init=uninitialized"
do_configure:prepend() {
    sed -i 's/-ftrivial-auto-var-init=pattern;//g' ${STAGING_LIBDIR}/cmake/Qt6/Qt6Targets.cmake
}
