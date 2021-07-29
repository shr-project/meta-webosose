# Copyright (c) 2021 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# this is missing in the upstream recipe, it detects that pkgconfig is missing:
# -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
# and then fails because sensorfw is required but isn't detected:
# Sensorfw pkg not found. Looking for library
# CMake Error at cmake/FindSensorfw.cmake:9 (find_library):
#   find_library called with incorrect number of arguments
inherit pkgconfig
