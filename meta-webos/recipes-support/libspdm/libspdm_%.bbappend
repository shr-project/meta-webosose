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
SECURITY_STACK_PROTECTOR = ""
