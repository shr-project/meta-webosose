# Copyright (c) 2012-2025 LG Electronics, Inc.

MAINTAINER = "Joseph Park <dongseon.park@lge.com>"

WEBOS_DISTRO_VERSION_CODENAME = "master"
WEBOS_DISTRO_BUILD_CODENAME = "master"

TARGET_VENDOR = "-webos"

require conf/distro/include/webos-component-head.inc
require conf/distro/include/webos-preferred-providers.inc
require conf/distro/include/webos-recipe-blacklist.inc
require conf/distro/include/webos-preferred-versions.inc
require conf/distro/include/webos-toolchain.inc
require conf/distro/include/webos-sdk.inc
require conf/distro/include/webos-icecc-components-exclusion.inc
require conf/distro/include/webos-localization-locales.inc

# Set default component author and rp maintainer
AUTHOR ?= "Unspecified"
WEBOS_RP_MAINTAINER ?= "Unspecified"

# Disable building of static libraries
require conf/distro/include/no-static-libs.inc

# Enable security flags
# can be dropped once the same is included in defaultsetup.inc:
# http://lists.openembedded.org/pipermail/openembedded-core/2018-July/153408.html
require ${COREBASE}/meta/conf/distro/include/security_flags.inc
SECURITY_STACK_PROTECTOR = "-fstack-protector-all"

# Enable -Werror=return-type flag
EXTRA_WEBOS_WERROR = "-Werror=return-type"
# http://gecko.lge.com:8000/Errors/Details/565722
# bcm2835/1.71-r0/bcm2835-1.71/examples/spiram/spiram.c:66:1: error: control reaches end of non-void function [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-bcm2835 = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564610
EXTRA_WEBOS_WERROR:pn-openipmi = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564608
EXTRA_WEBOS_WERROR:pn-indent = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564607
EXTRA_WEBOS_WERROR:pn-acpitool = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564606
EXTRA_WEBOS_WERROR:pn-libdbus-c++ = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564605
EXTRA_WEBOS_WERROR:pn-strongswan = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564604
EXTRA_WEBOS_WERROR:pn-joe = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564603
EXTRA_WEBOS_WERROR:pn-inotify-tools = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564602
EXTRA_WEBOS_WERROR:pn-smem = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564601
EXTRA_WEBOS_WERROR:pn-ckermit = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564600
EXTRA_WEBOS_WERROR:pn-mbuffer = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564599
EXTRA_WEBOS_WERROR:pn-dhrystone = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564598
EXTRA_WEBOS_WERROR:pn-cscope = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564597
EXTRA_WEBOS_WERROR:pn-gtk+3 = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1564595
EXTRA_WEBOS_WERROR:pn-gst-plugins-base = ""
# http://caprica.lgsvl.com:8080/Builds/Details/5772400
EXTRA_WEBOS_WERROR:pn-gst-plugins-good = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1574051
EXTRA_WEBOS_WERROR:pn-read-edid = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1584264
EXTRA_WEBOS_WERROR:pn-testfloat = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1584263
EXTRA_WEBOS_WERROR:pn-libc-bench = ""
# http://caprica.lgsvl.com:8080/Errors/Details/1584262
EXTRA_WEBOS_WERROR:pn-qtwebengine = ""
# Temporarily until patches from PLAT-84533 are integrated
EXTRA_WEBOS_WERROR:pn-webruntime = ""
# ERROR: ntop-5.0.1-r0 do_compile: Function failed: do_compile: netflowPlugin.c:2144:1: error: no return statement in function returning non-void [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-ntop = ""
# ERROR: python3-twofish-0.3.0-r0 do_compile: Function failed: do_compile: twofish.c:45:1: error: control reaches end of non-void function [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-python3-twofish = ""
# python3-gevent/20.6.2-r0/gevent-20.6.2/deps/libev/ev_iouring.c:227:1: error: no return statement in function returning non-void [-Werror=return-type]
# python3-gevent/20.6.2-r0/gevent-20.6.2/deps/libev/ev_iouring.c:261:1: error: no return statement in function returning non-void [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-python3-gevent = ""
# ERROR: live555-20190828-r0 do_compile: oe_runmake failed: MPEG2TransportStreamParser.cpp:302:1: error: control reaches end of non-void function [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-live555 = ""
# ERROR: hdf5-1.8.21-r0 do_compile: hdf5/1.8.21-r0/hdf5-1.8.21/c++/src/H5Location.cpp:258:34: error: control reaches end of non-void function [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-hdf5 = ""
# ERROR: libev-4.31-r0 do_compile: oe_runmake failed: libev-4.31/ev_iouring.c:227:1: error: no return statement in function returning non-void [-Werror=return-type] libev-4.31/ev_iouring.c:261:1: error: no return statement in function returning non-void [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-libev = ""
# temporarily until https://lists.openembedded.org/g/openembedded-devel/message/85109 is resolved: git/meson.build:26:4: ERROR: C library 'argp' not found
EXTRA_WEBOS_WERROR:pn-zchunk = ""
# ERROR: python3-yarl-1.6.2-r0 do_compile: 'python3 setup.py build ' execution failed.; yarl/_quoting_c.c:10703:1: error: control reaches end of non-void function [-Werror=return-type]
EXTRA_WEBOS_WERROR:pn-python3-yarl = ""
# webkitgtk/2.30.4-r0/webkitgtk-2.30.4/Source/JavaScriptCore/assembler/AbstractMacroAssembler.h:930:5: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com/Errors/Details/112515
EXTRA_WEBOS_WERROR:pn-webkitgtk = ""
# mpich-3.4.1/src/mpl/src/sock/mpl_sockaddr.c:144:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com/Errors/Details/126261
EXTRA_WEBOS_WERROR:pn-mpich = ""
# audit/3.0.1-r0/git/src/libev/ev_iouring.c:300:1: error: no return statement in function returning non-void [-Werror=return-type]
# http://gecko.lge.com/Errors/Details/175789
EXTRA_WEBOS_WERROR:pn-audit = ""
# mtools-4.0.29/mk_direntry.c:308:1: error: control reaches end of non-void function [-Werror=return-type]
# introduced in:
# https://git.openembedded.org/openembedded-core/commit/?id=4d117a12bf0d25848c18ccda17e047b60af8bb67
# http://gecko.lge.com/Errors/Details/186495
EXTRA_WEBOS_WERROR:pn-mtools = ""
# rocksdb/6.20.3-r0/git/utilities/transactions/lock/range/range_tree/lib/locktree/../portability/toku_time.h:181:1: error: control reaches end of non-void function [-Werror=return-type]
# introduced in:
# https://git.openembedded.org/meta-openembedded/commit/?id=912be5179c9e65fa33e9ca98c7f82d32ba31e827
# http://gecko.lge.com/Errors/Details/192773
EXTRA_WEBOS_WERROR:pn-rocksdb = ""
# grpc/1.45.0-r0/git/src/core/lib/transport/metadata_batch.h: In static member function 'static std::string grpc_core::GrpcStreamNetworkState::DisplayValue(grpc_core::GrpcStreamNetworkState::ValueType)':
# grpc/1.45.0-r0/git/src/core/lib/transport/metadata_batch.h:533:3: error: control reaches end of non-void function [-Werror=return-type]
# introduced in 1.45.0 version in:
# https://git.openembedded.org/meta-openembedded/commit/?id=df5b764f99dbb19048ebef9d6b85e4d3625b4272
# https://github.com/grpc/grpc/commit/9454ab091243b0539ac9ba578e9ae9d5de5d26f0#diff-78e2a4b53390e4455f4e90b043d1bb887686ffa1323968ccf161422298c543c9R514
EXTRA_WEBOS_WERROR:pn-grpc = ""
# src/os/linux/main.c: In function 'usage':
# src/os/linux/main.c:36:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/583310
EXTRA_WEBOS_WERROR:pn-dialog-lvgl = ""
# ../../libiodbc-3.52.15/iodbcinst/unicode.c: In function '_WCHARSIZE':
# ../../libiodbc-3.52.15/iodbcinst/unicode.c:695:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/583308
EXTRA_WEBOS_WERROR:pn-libiodbc = ""
# libcbor/0.10.2-r0/git/src/cbor.c:151:1: error: control reaches end of non-void function [-Werror=return-type]
# libcbor/0.10.2-r0/git/src/cbor/serialization.c:41:1: error: control reaches end of non-void function [-Werror=return-type]
# libcbor/0.10.2-r0/git/src/cbor/floats_ctrls.c:59:1: error: control reaches end of non-void function [-Werror=return-type]
# and many more
# http://gecko.lge.com:8000/Errors/Details/597615
EXTRA_WEBOS_WERROR:pn-libcbor = ""
# src/cpp/parser.cpp:463:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/749006
EXTRA_WEBOS_WERROR:pn-python3-fastnumbers = ""
# rust-llvm/1.74.1/rustc-1.74.1-src/src/llvm-project/llvm/lib/ExecutionEngine/JITLink/aarch32.cpp:182:1: error: no return statement in function returning non-void [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/755893
EXTRA_WEBOS_WERROR:pn-rust-llvm = ""
# src/core/lib/promise/party.h:567:5: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/793628
EXTRA_WEBOS_WERROR:pn-python3-grpcio = ""
# cppgenerate/printer.cpp:47:1: error: no return statement in function returning non-void [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/926532
EXTRA_WEBOS_WERROR:pn-cppgenerate = ""
# canopenterm/1.0.8/git/src/core/can_linux.c:140:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/1029672
EXTRA_WEBOS_WERROR:pn-canopenterm = ""
# multidict/_multilib/pair_list.h:1579:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/1165425
EXTRA_WEBOS_WERROR:pn-python3-multidict = ""
# libsimplelog/1.0.4+git/git/src/simplelog.c:1764:1: error: no return statement in function returning non-void [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/1175904
EXTRA_WEBOS_WERROR:pn-libsimplelog = ""
# webrtc-audio-processing-2.1/webrtc/modules/audio_processing/agc2/rnn_vad/rnn_fc.cc:63:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/1203899
EXTRA_WEBOS_WERROR:pn-webrtc-audio-processing-2 = ""
# work-shared/llvm-project-source-20.1.3-r0/llvm-project-20.1.3.src/lldb/source/DataFormatters/TypeSummary.cpp:62:1: error: control reaches end of non-void function [-Werror=return-type]
# http://gecko.lge.com:8000/Errors/Details/1186664
EXTRA_WEBOS_WERROR:pn-clang = ""

TARGET_CC_ARCH:append = " ${EXTRA_WEBOS_WERROR}"

#
# Form the codename of a release (WEBOS_DISTRO_RELEASE_CODENAME) from a codename
# that represents the major set of features of the platform
# (WEBOS_DISTRO_PLATFORM_CODENAME) and a codename that represents the features
# of the particular DISTRO_VERSION being released (WEBOS_DISTRO_VERSION_CODENAME).
# The two more or less correspond the the major and minor versions of
# DISTRO_VERSION, but allow there to be a name for them ahead of the assignment
# of actual version numbers. It is expected that there will be several version
# codenames with the same platform codename under active development at the same
# time.
#
# It is expected that other distros will override these definitions based on
# their codename schemes.
#
WEBOS_DISTRO_PLATFORM_CODENAME ?= "${DISTRO}"
WEBOS_DISTRO_VERSION_CODENAME ?= "${@oe.buildcfg.get_metadata_git_branch('.', None).strip().translate(str.maketrans('','','()/'))}"

# Increase when release is not compatible to previous one which has the same distro platform
WEBOS_DISTRO_RELEASE_EPOCH ?= ""
WEBOS_DISTRO_RELEASE_CODENAME ?= "${WEBOS_DISTRO_PLATFORM_CODENAME}${WEBOS_DISTRO_RELEASE_EPOCH}-${WEBOS_DISTRO_VERSION_CODENAME}"

#
# Indicate webOS Platform version to programmatically evaluate if it's higher
# than another.
#
WEBOS_DISTRO_RELEASE_PLATFORMCODE ?= ""

# This is the codename for the series of builds that are made from a branch.
# It appears in the image filenames. It is expected that other distros will
# override this based on their codename schemes.
WEBOS_DISTRO_BUILD_CODENAME ?= "${@oe.buildcfg.get_metadata_git_branch('.', None).strip().translate(str.maketrans('','','()/'))}"

#
# All of the types of official build jobs should override WEBOS_DISTRO_BUILD_ID
# in the following format: "[[<prefix>.]<site>-]<build-number>", where the
# optional <site> identifies the build server site, and the optional <prefix>
# distinguishes the different types of build jobs, for example, verification
# builds. <prefix> is left off for the "official" build and <site> is dropped
# for the authoritative "official" build. <build-number> is expected to be an
# integer. Note that WEBOS_DISTRO_BUILD_CODENAME is never included in
# WEBOS_DISTRO_BUILD_ID.
#
WEBOS_DISTRO_BUILD_ID ?= "unofficial"

# Only suffix image names with DATETIME when the build is unofficial; otherwise,
# use WEBOS_DISTRO_BUILD_ID. By default, the build codename (or, if it's defined,
# WEBOS_DISTRO_BRANCHPOINT_MICRO_VERSION with its hyphen replaced with a period)
# is always prepended to the suffix, but this can be overridden.
WEBOS_IMAGE_BUILD_CODENAME ?= "${@ \
    '-' + d.getVar('WEBOS_DISTRO_BRANCHPOINT_MICRO_VERSION').replace('-', '.') \
    if d.getVar('WEBOS_DISTRO_BRANCHPOINT_MICRO_VERSION') else \
    '-${WEBOS_DISTRO_BUILD_CODENAME}' \
}"

IMAGE_VERSION_SUFFIX = "${WEBOS_IMAGE_BUILD_CODENAME}-${@oe.utils.conditional( \
                                  'WEBOS_DISTRO_BUILD_ID', 'unofficial', \
                                  '${DATETIME}', '${WEBOS_DISTRO_BUILD_ID}', d) }"

# Without this, the shared state is always invalidated
# during the build which has different WEBOS_DISTRO_BUILD_ID
IMAGE_VERSION_SUFFIX[vardepsexclude] += "WEBOS_DISTRO_BUILD_ID"

# Don't use default '.rootfs' suffix
IMAGE_NAME_SUFFIX = ""
IMAGE_NAME = "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME_SUFFIX}"
IMAGE_LINK_NAME = "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"

INITRAMFS_IMAGE_NAME = "${@['${INITRAMFS_IMAGE}${IMAGE_MACHINE_SUFFIX}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"

# Use a different naming scheme for webOS kernel images that uses the component
# name instead of the name of the image format (KERNEL_IMAGETYPE) and leaves off
# the version.
WEBOS_KERNEL_IMAGE_NAME_PARTITION_SUFFIX ?= ""
KERNEL_ARTIFACT_NAME ?= "${MACHINE}${WEBOS_KERNEL_IMAGE_NAME_PARTITION_SUFFIX}"
KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"

# By default, kernels for webOS don't need module tarballs to be deployed, but
# still define webOS-style base name for them in case some MACHINE.conf enables
# their deployment.
MODULE_TARBALL_DEPLOY ?= "0"

# webOS doesn't use kernel-image-name, so don't include it, which allows us to
# vardepsexclude KERNEL_IMAGE_NAME. This makes it possible to execute the
# kernel's do_deploy (which is quick) every time the kernel is built without
# having to also execute its do_install (which is lengthy), and thereby have its
# image filename match that of the corresponding rootfs image even if its
# contents are unchanged.
kernel_do_install[vardepsexclude] += "KERNEL_IMAGE_NAME"
kernel_do_install:append() {
	rm -vf $kerneldir/kernel-image-name
}

# Add WEBOS_DISTRO_RELEASE_CODENAME and WEBOS_DISTRO_BUILD_ID to what's displayed
# as the "build configuration".
BUILDCFG_VARS += "WEBOS_DISTRO_RELEASE_CODENAME WEBOS_DISTRO_BUILD_ID"

# Branch, revision and description of TOPDIR (build-* repository)
WEBOS_DISTRO_TOPDIR_BRANCH ?= "${@oe.buildcfg.get_metadata_git_branch('${TOPDIR}').strip()}"
WEBOS_DISTRO_TOPDIR_REVISION ?= "${@oe.buildcfg.get_metadata_git_revision('${TOPDIR}').strip()}"
WEBOS_DISTRO_TOPDIR_DESCRIBE ?= "${@webos_base_get_metadata_git_describe('${TOPDIR}').strip()}"
# Don't add WEBOS_DISTRO_TOPDIR_BRANCH, because in many cases it can be "(nobranch)"
BUILDCFG_VARS += "WEBOS_DISTRO_TOPDIR_REVISION WEBOS_DISTRO_TOPDIR_DESCRIBE"

# Add build timestamp to what's displayed in build-id.txt for use in pruning script
BUILDCFG_VARS += "DATETIME"

# Describe webos profile in build configurations at the beginning of the build
BUILDCFG_VARS += "WEBOS_TARGET_DISTRO_VARIANT DISTRO_FEATURES MACHINE_FEATURES IMAGE_FEATURES"

# Add the same variables from BUILDCFG_VARS to /etc/buildinfo as well
IMAGE_BUILDINFO_VARS = "${BUILDCFG_VARS}"

# Build time dependency on TUNE_PKGARCH recipes base-passwd, shadow, shadow-sysroot
# Drop this when upgrading oe-core to some release with this change:
# http://lists.openembedded.org/pipermail/openembedded-core/2013-November/085849.html
PACKAGE_ARCH:pn-xuser-account = "${MACHINE_ARCH}"

# Override these in webOS based distros to modify DISTRO_EXTRA_R*
WEBOS_DEFAULT_EXTRA_RDEPENDS = ""
WEBOS_DEFAULT_EXTRA_RRECOMMENDS = ""

DISTRO_EXTRA_RDEPENDS += " ${WEBOS_DEFAULT_EXTRA_RDEPENDS}"
DISTRO_EXTRA_RRECOMMENDS += " ${WEBOS_DEFAULT_EXTRA_RRECOMMENDS}"

USER_CLASSES ?= ""

# Configure Bluetooth service classes we want to support
WEBOS_BLUETOOTH_ENABLED_SERVICE_CLASSES ?= "FTP"

# WEBOS_EXTRA_MACHINEOVERRIDES will appear in OVERRIDES before what's added by
# the machine architecture .inc file, which appears before MACHINE.
# WEBOS_EXTRA_MACHINEOVERRIDES is set in webos_machine_impl_dep.bbclass . Do it
# this way instead of just in the bbclass so that the position in OVERRIDES is
# fixed.
WEBOS_EXTRA_MACHINEOVERRIDES ?= ""
MACHINEOVERRIDES =. "${WEBOS_EXTRA_MACHINEOVERRIDES}"
MACHINEOVERRIDES[vardepsexclude] += "WEBOS_EXTRA_MACHINEOVERRIDES"
OVERRIDES[vardepsexclude] += "WEBOS_EXTRA_MACHINEOVERRIDES"

# WEBOS_EXTRA_MACHINEOVERRIDES_VARIANT will appear in OVERRIDES before what's added by
# the machine architecture .inc file, which appears before MACHINE.
# WEBOS_EXTRA_MACHINEOVERRIDES_VARIANT is set in webos_machine_variant_dep.bbclass .
# Do it this way instead of just in the bbclass so that the position in OVERRIDES is
# fixed.
WEBOS_EXTRA_MACHINEOVERRIDES_VARIANT ?= ""
MACHINEOVERRIDES =. "${WEBOS_EXTRA_MACHINEOVERRIDES_VARIANT}"
MACHINEOVERRIDES[vardepsexclude] += "WEBOS_EXTRA_MACHINEOVERRIDES_VARIANT"
OVERRIDES[vardepsexclude] += "WEBOS_EXTRA_MACHINEOVERRIDES_VARIANT"

# Use separate variable for PREFERRED_ARM_INSTRUCTION_SET.
# If you want to override distro selection for some group (e.g. based on
# MACHINE, architecture or some TUNE_PKGARCH) you apply the override
# only to PREFERRED_ARM_INSTRUCTION_SET variable, so that
# ARM_INSTRUCTION_SET assignments without any override in the recipes
# still work.
# E.g. distro default is thumb (for all MACHINEs)
# Then you find some issues with thumb1 on armv5te cores, so distro can
# change the default to "arm" with PREFERRED_ARM_INSTRUCTION_SET:armv5,
# but the recipe which explicitly asks for "thumb" still gets thumb.
PREFERRED_ARM_INSTRUCTION_SET ?= "thumb"
ARM_INSTRUCTION_SET = "${PREFERRED_ARM_INSTRUCTION_SET}"

# Work around FTBFS when building valgrind with ptest and thumb enabled
# valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/ldrt_arm.c
# {standard input}: Assembler messages:
# {standard input}:42: Error: cannot use post-indexing with this instruction -- `ldrt r6,[r5],#+132'
# {standard input}:42: Error: cannot use post-indexing with this instruction -- `ldrt r6,[r5],#132'
# ...
# ARM_INSTRUCTION_SET:pn-valgrind = "arm"
# and remove -O2 as work around for ICE:
# 3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c:12:1: internal compiler error:
# Max. number of generated reload insns per insn is achieved (90)
# http://lists.openembedded.org/pipermail/openembedded-core/2014-September/097330.html
# both issues are still reproducible with 3.10.0 version imported from
# http://patchwork.openembedded.org/patch/83009/
# TARGET_CFLAGS:remove:pn-valgrind = "-O2"
PTEST_ENABLED:pn-valgrind = "0"
# parted and apr ptest currently doesn't build with gold
# http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132917.html
PTEST_ENABLED:pn-parted = "0"
PTEST_ENABLED:pn-apr = "0"
# https://github.com/kraj/meta-clang/commit/6523bcaefc3be49d4aae96a84eca20efcc914d3d
PTEST_ENABLED:pn-bcc = "0"
# https://github.com/kraj/meta-clang/commit/814d20901a71fd4d98a5a67789d69ef7e9a2169c
PTEST_ENABLED:pn-bpftrace = "0"

INHERIT_DISTRO ?= "devshell sstate license buildstats-summary webos_base remove-libtool image-buildinfo"

# webOS supports the generation of oss package information file.
# $ bitbake -c write_oss_pkg_info <image>
# Components can have oss-pkg-info file itself but it is forced to
# add checksum in LIC_FILES_CHKSUM if it contain oss-pkg-info.yaml
do_populate_lic:append() {
    """ To check oss-pkg-info.yaml """
    oss_filename = "oss-pkg-info.yaml"
    if os.path.isfile(os.path.join(d.getVar("S"), oss_filename)):
        if not os.path.isfile(os.path.join(destdir, oss_filename)):
            bb.fatal("%s is in source repository but LIC_FILES_CHKSUM doesn't include it." % oss_filename)
}

WARN_QA:append = " version-going-backwards webos-enh-sub-warning"
WEBOS_ERROR_QA_AUTOREV ?= "webos-enh-sub-autorev-error"
ERROR_QA:append = " webos-enh-sub-error acg-dirty acg-json ${WEBOS_ERROR_QA_AUTOREV} acg-api acg-perm ls2-role ls2-schema"
ERROR_QA:remove = " version-going-backwards"

# currently not used in OSE, but add it here to keep the same ERROR_QA across DISTROs (as much as possible)
ERROR_QA:append = " license_notice"
ERROR_QA:append = " incomp-lic-no-whitelist-error"
WARN_QA:append  = " incomp-lic-shlibdeps-warning"

# Add perm-file QA check based on distro feature
# perm-file currently isn't used since http://gpro.lge.com/c/webos-pro/meta-lg-webos/+/380606
# perm-line and perm-config are used since initial implementation in: http://gpro.lge.com/c/webos-pro/meta-lg-webos/+/367700
# but were never added to ERRROR_QA
# This doesn't need to be conditional on DISTRO_FEATURES as the *-dac.inc
# won't be included by DISTROs which don't want it (and without it nothing
# will call oe.qa.handle_error("perm-{file,line,config}", msg, d).
ERROR_QA:append = " perm-file perm-line perm-config"

# Move all default WARN_QA from insane.bbclass to ERROR_QA to prevent silently re-introducing these issues
# as of https://git.openembedded.org/openembedded-core/commit/?id=b79b191cc43a45dde2adb61ea349b426cb2461d1
DEFAULT_WARN_QA = "\
    32bit-time native-last \
"
# We can enable native-last for layers we use:
ERROR_QA:append = " native-last"
WARN_QA:remove = "native-last"

# Default WEBOS_TARGET_* values (see webos_cmake.bbclass)
WEBOS_TARGET_CORE_OS ?= "rockhopper"

# Change default PACKAGE_ARCH to MACHINE_ARCH, one of important goals for OE
# is to share binary feed and sstate between MACHINEs with the same architecture
# design of some webOS components doesn't support this very well - TUNE_PKGARCH
# recipes (runtime) depending on MACHINE_ARCH recipes, couple of recipes
# could be TUNE_PKGARCH if the MACHINE-specific changes are moved to separate
# config file provided by small MACHINE_ARCH recipe instead of using MACHINE
# variable in build-time to customize component.
# All officially supported MACHINEs have different architecture, so we weren't
# sharing any packages/sstate.
# Be aware that this wasn't tested with nativesdk.
PACKAGE_ARCH = "${MACHINE_ARCH}"

# For toolchain recipes keep TUNE_PKGARCH, to support default STAGING_BINDIR_TOOLCHAIN
# as defined in bitbake.conf
# STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
PACKAGE_ARCH:pn-binutils-cross = "${TUNE_PKGARCH}"
PACKAGE_ARCH:pn-gcc-cross = "${TUNE_PKGARCH}"
PACKAGE_ARCH:pn-gcc-cross-initial = "${TUNE_PKGARCH}"
# libgcc.inc: target=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
PACKAGE_ARCH:pn-libgcc = "${TUNE_PKGARCH}"
# gcc-runtime.inc: mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
PACKAGE_ARCH:pn-gcc-runtime = "${TUNE_PKGARCH}"
PACKAGE_ARCH:pn-meta-toolchain = "${TUNE_PKGARCH}"
# since oe-core/c26569320817263a487eceb610e3c70badba0b52 it's ${TUNE_PKGARCH} but it depends
# on strace, which in our strange default PACKAGE_ARCH is MACHINE_ARCH
PACKAGE_ARCH:pn-packagegroup-core-tools-debug = "${MACHINE_ARCH}"
# depends on pkgconfig which depends on libtool-cross which is MACHINE_ARCH in webOS
# and since oe-core/ac6ec1979caa4032b710eb6f6523bcca29d42cd4 this packagegroup was TUNE_PKGARCH
PACKAGE_ARCH:pn-packagegroup-core-buildessential = "${MACHINE_ARCH}"

# Respect PACKAGE_ARCH set in recipe, otherwise building sdk will fail to find
# packagegroup-cross-canadian-qemux86 package in MACHINE_ARCH feed (opkg-sdk.conf
# doesn't contain MACHINE_ARCH).
PACKAGE_ARCH:pn-packagegroup-cross-canadian-qemux86 = "${SDK_ARCH}-${SDKPKGSUFFIX}"

# Otherwise QEMU_EXTRAOPTIONS aren't found and e.g. update_font_cache postinst
# script may fail to run fc-cache with:
# qemu: uncaught target signal 4 (Illegal instruction) - core dumped
# because -cpu options are missing in QEMU_OPTIONS
PACKAGE_ARCH:pn-qemuwrapper-cross = "${TUNE_PKGARCH}"

# Added here as no better place for qemu machine
MACHINE_FEATURES:append:qemuall = " webos-graphics-drm"

# This is needed e.g. for nodejs where PACKAGE_ARCH is set to MACHINE_ARCH
# but instead of depending on qemuwrapper-cross it creates its own qemu wrapper
# with help of qemu.bbclass's qemu_wrapper_cmdline which uses QEMU_OPTIONS with:
# ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}
# which was always empty in our builds, causing Illegal instructions.
# Also notice qemux86_64 instead of qemux86-64, because it's _${MACHINE_ARCH}, not
# an old syntax override _${MACHINE}.
QEMU_EXTRAOPTIONS_qemux86 = "${QEMU_EXTRAOPTIONS_core2-32}"
QEMU_EXTRAOPTIONS_qemux86_64 = "${QEMU_EXTRAOPTIONS_core2-64}"

PATH:prepend = "${WEBOS_EXTRA_PATH}"

EXTRAOPKGCONFIG = ""
# with multilib libdir would became /usr/lib64 and we want opkg files in /usr/lib
OPKGLIBDIR:forcevariable := "${exec_prefix}/lib"

# We don't plan to ever support qt4
QT_DIR_NAME = ""

BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},2G,100K \
    STOPTASKS,${DL_DIR},2G,100K \
    STOPTASKS,${SSTATE_DIR},2G,100K \
    STOPTASKS,/tmp,200M,100K \
    HALT,${TMPDIR},1G,10K \
    HALT,${DL_DIR},1G,10K \
    HALT,${SSTATE_DIR},1G,10K \
    HALT,/tmp,100M,10K \
"

# Select at most one of the two choices here for the console:
#   Redirect console output to keep it from spewing all over the Emulator window
#   (This is added to qemux86 kernel cmdline by openembedded-core/meta/classes/syslinux.bbclass)
APPEND:append:qemuall = " console=ttyS0 net.ifnames=0 biosdevname=0"
# - or -
#   If your build is not using the screen for graphics, and you're running an emulator,
#   you should be able to use the emulator's on-screen window as the console by
#   uncommenting this line (and commenting the above line out).
#   Note that this setting may interfere with a program that is trying to change the
#   mode of the display device
# APPEND:append:qemuall = " console=tty0"

require conf/distro/include/yocto-uninative.inc
INHERIT += "uninative"

SANITY_TESTED_DISTROS ?= " \
    ubuntu-20.04 \n \
    ubuntu-22.04 \n \
    ubuntu-24.04 \n \
    ubuntu-24.10 \n \
"

# Override setting in upstream fontcache.bbclass and fontconfig recipe
FONTCONFIG_CACHE_DIR = "${datadir}/fontconfig/cache"
FONTCONFIG_CACHE_ENV = "FC_DEBUG=16"

# To build lapack(blas) for snowboy
FORTRAN:forcevariable = ",fortran"

# Qt major version to use
QT_VERSION ?= "6"

# Disable ptests of Qt recipes as unused and burdensome
# Some ptests are even broken due to dependency to Qt::Widget
QT_PTEST_ENABLED = "0"

# Add author and rp maintainer to package metadata
# PACKAGE_ADD_{AUTHOR,RPMAINTAINER}_METADATA is set by pkg_add_extra_metadata handler in webos_base.bbclass
PACKAGE_ADD_AUTHOR_METADATA ?= "${AUTHOR}"
PACKAGE_ADD_RPMAINTAINER_METADATA ?= "${WEBOS_RP_MAINTAINER}"
PACKAGE_ADD_METADATA = "Author: ${PACKAGE_ADD_AUTHOR_METADATA}\nRP-Maintainer: ${PACKAGE_ADD_RPMAINTAINER_METADATA}"

# Add recipes information to package metadata
# PACKAGE_ADD_RECIPES_METADATA is set by pkg_add_extra_metadata handler in webos_base.bbclass
PACKAGE_ADD_RECIPES_METADATA ?= ""
PACKAGE_ADD_METADATA .= "\n${PACKAGE_ADD_RECIPES_METADATA}"

# Force PACKAGE_CLASSES to IPK, currently webOS support IPK only
PACKAGE_CLASSES = "package_ipk"

# Avoid adding these fields to RPM and DEP
# breaking RPM builds as shown in http://errors.yoctoproject.org/Errors/Details/751706/
PACKAGE_ADD_METADATA_RPM = ""
PACKAGE_ADD_METADATA_DEP = ""

# To support these fields with opkg package-index where it causes a lot of "Lost field" messages
# we need to pass -f to opkg-make-index as it was added in:
# https://git.yoctoproject.org/opkg-utils/commit/opkg-make-index?id=13f6281d24e17199e0fef6c2984419372ea0f86f
# see:
# https://git.openembedded.org/openembedded-core/commit/?id=6dc772fd9d5c2d90a6e32cfa4bc46ca0221f1b7f
# https://git.openembedded.org/openembedded-core/commit/?id=31030e7a19a27ad424b997fad36ee4f633ce0d63
OPKG_MAKE_INDEX_EXTRA_PARAMS = "-f"
RPMBUILD_EXTRA_PARAMS = " --define '_Author Author' --define '_RP-Maintainer RP-Maintainer' --define '_Recipes Recipes'"

# Set ccache configuration from <top layer>/conf/ccache.conf
export CCACHE_CONFIGPATH = "${@bb.utils.which('${BBPATH}', 'conf/ccache.conf')}"
export CCACHE_COMPILERCHECK = "content"
export CCACHE_READONLY ?= "1"
# Do not use ccache by default.
CCACHE_DISABLE ?= "1"

# Enable ccache read-only or read-write, Add the following variable to prevent sstate cache miss.
BB_HASHEXCLUDE_COMMON:append = " CCACHE_READONLY CCACHE_NOREADONLY CCACHE_DISABLE"

# ccache allowed component list
CCACHE_DISABLE:pn-webruntime = "0"
CCACHE_DISABLE:pn-webruntime-clang = "0"
CCACHE_DISABLE:pn-nodejs = "0"
CCACHE_DISABLE:pn-opencv = "0"
CCACHE_DISABLE:pn-arm-compute-library = "0"

# Disable showing warning logs when unpatched CVEs are found using INHERIT += "cve_check"
CVE_CHECK_SHOW_WARNINGS = "0"

# Specify the name of the recipe you want to exclude from the cve check.
CVE_CHECK_SKIP_RECIPE += "${MLPREFIX}configurator"
