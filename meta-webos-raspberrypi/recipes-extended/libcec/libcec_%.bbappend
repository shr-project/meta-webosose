# Copyright (c) 2017 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosrpi1"

# The recipe in meta-oe already has conditional dependency:
# DEPENDS:append:rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
# but in our builds the userland is used even when vc4graphics is in MACHINE_FEATURES
DEPENDS:append:rpi = " virtual/libomxil"
