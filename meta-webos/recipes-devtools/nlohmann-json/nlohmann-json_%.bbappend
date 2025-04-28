# Copyright (c) 2025 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# We need to revert changes from
# nlohmann-json: Upgrade 3.11.3 -> 3.12.0
# because as described in:
# http://lists.openembedded.org/pipermail/openembedded-commits/2017-November/215520.html
# http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156694.html
# it doesn't work when GLIBC_GENERATE_LOCALES are restricted like they are in our builds:
# meta-webos/conf/distro/include/webos-toolchain.inc:GLIBC_GENERATE_LOCALES = "en_US.UTF-8"

# http://gecko.lge.com:8000/Errors/Details/1182826
# ERROR: QA Issue: nlohmann-json-ptest rdepends on locale-base-de-de, but it isn't a build dependency? [build-deps]

RDEPENDS:${PN}-ptest:remove = " \
    locale-base-de-de \
"
