# Copyright (c) 2025 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# We need to revert changes from
# https://git.openembedded.org/meta-openembedded/commit/?id=5756aa17e8cefc1be95b8fc6a9b8527570d1d683
# because as described in:
# http://lists.openembedded.org/pipermail/openembedded-commits/2017-November/215520.html
# http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156694.html
# it doesn't work when GLIBC_GENERATE_LOCALES are restricted like they are in our builds:
# meta-webos/conf/distro/include/webos-toolchain.inc:GLIBC_GENERATE_LOCALES = "en_US.UTF-8"

# http://gecko.lge.com:8000/Errors/Details/1150391
# ERROR: QA Issue: pv-ptest rdepends on glibc-binary-localedata-c, but it isn't a build dependency? [build-deps]

RDEPENDS:${PN}-ptest:remove:libc-glibc = " \
    glibc-binary-localedata-c \
"
