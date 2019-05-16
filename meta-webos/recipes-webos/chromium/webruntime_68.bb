# Copyright (c) 2018-2019 LG Electronics, Inc.

require webruntime.inc

PR = "${INC_PR}.1"

PROVIDES = "virtual/webruntime"

WEBOS_VERSION = "68.0.3440.106-74_d4f945186d3f5483f86c7f8d0e31c8147eb23248"
WEBOS_REPO_NAME = "chromium68"

WEBOS_REPO_NAME_V8 = "v8"
WEBOS_VERSION_V8 = "6.8.275.26-11_f9c8b32c039775f49581907d1a1edac191a8119d"
SRCREV_v8 = "a14b9160368813b7ebe146b2612a8fce7b403ac7"

# TODO: drop this after we migrate to ubuntu 16.04 or above
GN_ARGS += "\
    is_host_clang=true\
    host_toolchain=\"//build/toolchain/yocto:clang_yocto_native\" \
    fatal_linker_warnings=false\
"

python do_write_toolchain_file () {
    """Writes a BUILD.gn file for Yocto detailing its toolchains."""
    toolchain_dir = d.expand("${S}/src/build/toolchain/yocto")
    bb.utils.mkdirhier(toolchain_dir)
    toolchain_file = os.path.join(toolchain_dir, "BUILD.gn")
    write_toolchain_file(d, toolchain_file)
}
addtask write_toolchain_file after do_patch before do_configure
# end TODO: drop this after we migrate to ubuntu 16.04 or above

