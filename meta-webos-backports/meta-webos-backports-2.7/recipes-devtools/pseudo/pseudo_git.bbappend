# Copyright (c) 2019 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

# Use latest SRCREV and other changes from Yocto 3.0 Zeus, backported to Yocto 2.7 Warrior in:
# 1c09e45f96 pseudo: Add statx support to fix fedora30 issues
# c8c13ceafa pseudo: Drop static linking to sqlite3
# d1788e865d pseudo: Fix openat() with a symlink pointing to a directory
# 0fb257121b pseudo: Update to gain key bugfixes
# 042af40658 pseudo: fix link of sqlite3 using pkg-config
# b24a67217d pseudo: fix link with new sqlite3

# to fix random failures PLAT-48507 pseudo: random package_qa failures in glibc
# http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285259.html

LIC_FILES_CHKSUM = "file://COPYING;md5=a1d8023a6f953ac6ea4af765ff62d574"

SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"

inherit pkgconfig

# This might be also interesting
# http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285242.html

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-Add-statx.patch"

# Compile for the local machine arch...
do_compile () {
        SQLITE_LDADD='$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a'
        for sqlite_link_opt in $(pkg-config sqlite3 --libs --static)
        do
            case "$sqlite_link_opt" in
            -lsqlite3)
                ;;
            -l*)
                SQLITE_LDADD="${SQLITE_LDADD} ${sqlite_link_opt}"
                ;;
            *)
                ;;
            esac
        done
        if [ "${SITEINFO_BITS}" = "64" ]; then
          ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
        else
          ${S}/configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --with-static-sqlite="$SQLITE_LDADD" --without-rpath
        fi
        oe_runmake ${MAKEOPTS}
}
