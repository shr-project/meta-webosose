# Copyright (c) 2012-2025 LG Electronics, Inc.

require conf/distro/include/webos.inc

# Increment when features are changed
_pr_suffix .= ".2"

# Keep in sync with setting in oe-core/meta/conf/distro/include/default-distrovars.inc
# TODO: Maybe change this to use "_remove" when it's introduced in bitbake

# Split some features to separate variables
# Remove argp (not used in OE anymore) and x11 (not needed for webOS OSE)
WEBOS_DISTRO_FEATURES_DEFAULT = "debuginfod"
WEBOS_DISTRO_FEATURES_OPENGL = ""
WEBOS_DISTRO_FEATURES_WINDOW_SYSTEM = ""
WEBOS_DISTRO_FEATURES_GRAPHICS_BACKEND = ""
# Remove pci pcmcia
WEBOS_DISTRO_FEATURES_BUSES = ""
WEBOS_DISTRO_FEATURES_USB = ""
# connman requires wifi even it disable wifi in package config
# http://gecko.lge.com:8000/Errors/Details/802656
WEBOS_DISTRO_FEATURES_CONNECTIVITY = "wifi"
WEBOS_DISTRO_FEATURES_NETWORKING = ""

WEBOS_DISTRO_FEATURES_INIT = "systemd usrmerge"
WEBOS_DISTRO_FEATURES_INIT_CONSIDERED = "sysvinit"

DISTRO_FEATURES_BACKFILL_CONSIDERED += "${WEBOS_DISTRO_FEATURES_INIT_CONSIDERED}"

# default (empty) is bfd, ld-is-gold was used before, ld-is-lld is another option
WEBOS_DISTRO_FEATURES_LD = ""

WEBOS_DISTRO_FEATURES_TEST = "ptest"

DISTRO_FEATURES = " \
  ${WEBOS_DISTRO_FEATURES_DEFAULT} \
  ${WEBOS_DISTRO_FEATURES_OPENGL} \
  ${WEBOS_DISTRO_FEATURES_WINDOW_SYSTEM} \
  ${WEBOS_DISTRO_FEATURES_GRAPHICS_BACKEND} \
  ${WEBOS_DISTRO_FEATURES_BUSES} \
  ${WEBOS_DISTRO_FEATURES_USB} \
  ${WEBOS_DISTRO_FEATURES_CONNECTIVITY} \
  ${WEBOS_DISTRO_FEATURES_NETWORKING} \
  ${WEBOS_DISTRO_FEATURES_LD} \
  ${WEBOS_DISTRO_FEATURES_INIT} \
  ${WEBOS_DISTRO_FEATURES_TEST} \
"

# We won't use webos's initscripts for core-boot profile
VIRTUAL-RUNTIME_initscripts = ""
PREFERRED_RPROVIDER_initd-functions = ""

# Additional image features
IMAGE_FEATURES += ""

# Do not install recommended packages as default
NO_RECOMMENDATIONS ?= "1"
