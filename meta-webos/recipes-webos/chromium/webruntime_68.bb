# Copyright (c) 2018-2019 LG Electronics, Inc.

require webruntime.inc

PR = "${INC_PR}.1"

PROVIDES = "virtual/webruntime"

WEBOS_VERSION = "68.0.3440.106-75_0c9a29a2822fd545a65a1758aaa27afdfe750ee2"
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

# [PLAT-78282] mksnapshot from webruntime fails to run when host and target have different glibc version
GN_ARGS += "v8_snapshot_toolchain=\"//build/toolchain/yocto:clang_yocto_native\""
MKSNAPSHOT_PATH = "clang_yocto_native/"
MKSNAPSHOT_PATH_arm = "clang_yocto_native/"
MKSNAPSHOT_PATH_aarch64 = "clang_yocto_native/"

# Fix build with linux-headers-5.2
# http://caprica.lgsvl.com:8080/Errors/Details/1614408
# From: http://gpro.lge.com/254192
SRC_URI += " \
    file://0001-fix-build-after-y2038-changes-in-glibc.patch \
"

# make sure that python(2) is available, otherwise gn fails to execute python after it was removed from HOSTTOOLS in:
# http://git.openembedded.org/openembedded-core/commit/?id=5f8f16b17f66966ae91aeabc23e97de5ecd17447
#
# /jenkins/mjansa/build-ros-v3/artifacts/BUILD-webos-melodic-master.mcf/work/qemux86-webos-linux/webruntime/68.0.3440.106-75-r24.1/git/depot_tools/gn: line 8: exec: python: not found
# using python3 isn't supported in this old gn, it fails e.g. in gclient_utils.py because of invalid syntax for python3:
# Traceback (most recent call last):
#  File "/jenkins/mjansa/build-ros-v3/artifacts/BUILD-webos-melodic-master.mcf/work/qemux86-webos-linux/webruntime/68.0.3440.106-75-r24.1/git/depot_tools/gn.py", line 15, in <module>
#    import gclient_utils
#  File "/jenkins/mjansa/build-ros-v3/artifacts/BUILD-webos-melodic-master.mcf/work/qemux86-webos-linux/webruntime/68.0.3440.106-75-r24.1/git/depot_tools/gclient_utils.py", line 271
#    except OSError, e:
#                  ^
# SyntaxError: invalid syntax
# most (maybe all) of these issues were already fixed upstream in:
# https://chromium-review.googlesource.com/c/chromium/tools/depot_tools/+/1854900
# but there is a lot of conflicts in old gn used by this webruntime and there are many other places also still using python(2) here
# so lets use native python2 for now
inherit pythonnative

# Fix x86_64 builds with jsoncpp-1.7.7
SRC_URI += "file://0001-Fix-build-with-jsoncpp-1.7.7.patch"
