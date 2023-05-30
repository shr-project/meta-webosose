# Copyright (c) 2023 LG Electronics, Inc.

inherit webos_cmake
inherit clang_libc

DEPENDS += "clang-native"

OECMAKE_C_COMPILER = "clang"
OECMAKE_CXX_COMPILER = "clang++"

LIBCBE_DIR = "${libdir}/cbe"

TOOLCHAIN_OPTIONS = "\
    --sysroot=${STAGING_DIR_TARGET} \
    --target=${TARGET_SYS} \
    -stdlib=libc++ \
    -fuse-ld=${STAGING_BINDIR_NATIVE}/ld.lld \
    -nostdinc++ \
    -isystem ${STAGING_INCDIR}/c++/v1/ \
    -Wl,-L${STAGING_DIR_TARGET}/${LIBCBE_DIR} \
    -Wl,-rpath,${LIBCBE_DIR} \
    -D_LIBCPP_HAS_NO_VENDOR_AVAILABILITY_ANNOTATIONS \
"

TOOLCHAIN_OPTIONS:append = " ${@bb.utils.contains('USE_WEBRUNTIME_LIBCXX', '1', '-D_LIBCPP_ABI_UNSTABLE', '', d)}"
