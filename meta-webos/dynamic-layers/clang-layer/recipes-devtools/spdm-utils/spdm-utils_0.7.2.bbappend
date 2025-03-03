# Copyright (c) 2025 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# https://lists.openembedded.org/g/openembedded-devel/message/115732
# the build failure:
# http://gecko.lge.com:8000/Errors/Details/1124671
# note: gcc/aarch64-webos-linux/14.2.0/ld: spdm-utils/0.7.2/recipe-sysroot/usr/lib/libmemlib.a(zero_mem.c.o): undefined reference to symbol '__stack_chk_guard@@GLIBC_2.17'
#       gcc/aarch64-webos-linux/14.2.0/ld: spdm-utils/0.7.2/recipe-sysroot/usr/lib/ld-linux-aarch64.so.1: error adding symbols: DSO missing from command line
# is is caused by:
# meta-webos/conf/distro/include/webos.inc:SECURITY_STACK_PROTECTOR = "-fstack-protector-all"
# with default -fstack-protector-strong from security_flags.inc it builds fine
SECURITY_STACK_PROTECTOR="-fstack-protector-strong"

# but there is also
# http://gecko.lge.com:8000/Builds/Details/2935820
# WARNING: spdm-utils-0.7.2-r0 do_packagedata: QA Issue: package spdm-utils is depends on unmanaged libpci INCOMPATIBLE license shlibs provider which is not listed on STARFISH_INCOMPATIBLE_LICENSE_SHLIBS_PROVIDERS variable. (license of libpci=GPL-2.0-or-later) [incomp-lic-shlibdeps-warning]
# ERROR: spdm-utils-0.7.2-r0 do_packagedata: QA Issue: spdm-utils links incompatible licensed libpci shlibs without STARFISH_LINK_INCOMPATIBLE_LICENSE_SHLIBS_WHITELISTS variable. (license of libpci=GPL-2.0-or-later) [incomp-lic-no-whitelist-error]
STARFISH_INCOMPATIBLE_LICENSE_SHLIBS_PROVIDERS += " \
    ${MLPREFIX}libpci \
"
STARFISH_LINK_INCOMPATIBLE_LICENSE_SHLIBS_WHITELISTS:pn-spdm-utils = "${MLPREFIX}libpci"
