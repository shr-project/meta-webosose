# Copyright (c) 2019 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

# Use latest SRCREV which isn't even in Yocto 2.8 Zeus yet
# to fix random failures PLAT-48507 pseudo: random package_qa failures
# http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285259.html

LIC_FILES_CHKSUM = "file://COPYING;md5=a1d8023a6f953ac6ea4af765ff62d574"

SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"

# This might be also interesting
# http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285242.html
