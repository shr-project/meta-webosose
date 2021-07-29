# Copyright (c) 2018-2020 LG Electronics, Inc.

EXTENDPRAUTO:append:rpi = "webosrpi4"

DEPENDS:append:rpi = " webos-wayland-extensions"

PACKAGECONFIG:append:rpi = " kms wayland"

PACKAGECONFIG:remove:rpi = "faad"
