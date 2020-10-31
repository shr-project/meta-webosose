# Copyright (c) 2018-2020 LG Electronics, Inc.

EXTENDPRAUTO_append_rpi = "webosrpi4"

DEPENDS_append_rpi = " webos-wayland-extensions"

PACKAGECONFIG_append_rpi = " kms wayland"

PACKAGECONFIG_remove_rpi = "faad"
