# Copyright (c) 2020-2021 LG Electronics, Inc.
WEBRUNTIME_REPO_VERSION = "84"
require webruntime.inc

PROVIDES = "virtual/webruntime"

PR = "${INC_PR}.3"

# Since _remove is always applied LAST, we cannot implement
# GN_ARGS_remove = "ozone_platform_wayland_external=true" here
# but thanks gn it overrides former gn args values with later ones
# so we just add appropriate args to the end of its list:
PACKAGECONFIG[google_ozone_wayland] = "\
    ozone_platform_wayland=true ozone_platform_wayland_external=false,\
    ozone_platform_wayland=false ozone_platform_wayland_external=true"

PACKAGECONFIG[v8_lite] = "v8_enable_lite_mode=true,v8_enable_lite_mode=false"

PACKAGECONFIG_remove="jumbo"

GN_ARGS_append = " \
  use_system_minigbm=false \
    use_wayland_gbm=false \
"

GN_ARGS_append = " \
  libdir=\"${libdir}\"\
  includedir=\"${includedir}\"\
"

# TODO: qemux86 build fails
PACKAGECONFIG_remove_qemux86 = "gstreamer umediaserver neva-media gav neva-webrtc"
#END TODO
