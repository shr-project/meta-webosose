# Copyright (c) 2019-2020 LG Electronics, Inc.

require webruntime.inc

PROVIDES = "virtual/webruntime"

PR = "${INC_PR}.1"

WEBOS_GIT_PARAM_BRANCH_V8 = "@chromium72"

WEBOS_VERSION = "72.0.3626.121-23_42d6d7d0b8caf517f7f0d36501361eeec5b05954"
WEBOS_REPO_NAME = "chromium72"
WEBOS_REPO_NAME_V8 = "chromium-v8"

WEBOS_VERSION_V8 = "7.2.502.28-chromium72.7_cd41b2480f1e1c640887d70cd4435bae2ed55165"
SRCREV_v8 = "3c24ac757b6083171b208457e5ff7b2a15e5863e"

# In Neva we have changes to pass host extra flags
GN_ARGS_append = " host_pkg_config=\"pkg-config-native\""

# TODO: get rid of this when (and if) we adopt GPU info collector patch
GN_ARGS_remove = "use_webos_gpu_info_collector=true"

# Disable closure_compile
# Else we need HOSTTOOLS += "java"
GN_ARGS_append = " closure_compile=false"

CBE_DATA_LOCALES_PATH = "${CBE_DATA_PATH}/neva_locales"
LTTNG_PROVIDER = "liblttng_provider.so"

# Fix build with linux-headers-5.2
# http://caprica.lgsvl.com:8080/Errors/Details/1614408
# From: http://gpro.lge.com/254192
SRC_URI += " \
    file://0001-fix-build-after-y2038-changes-in-glibc.patch \
"
