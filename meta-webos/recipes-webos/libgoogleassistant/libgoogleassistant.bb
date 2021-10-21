# Copyright (c) 2018-2020 LG Electronics, Inc.

SUMMARY = "Google assistant engine library"
AUTHOR = "Kyungjik Min <dp.min@lge.com>"
SECTION = "webos/library"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
    file://oss-pkg-info.yaml;md5=9e4744182d366ff5258e3268c575afe2 \
"

DEPENDS = "glib-2.0 googleapis grpc json-c pmloglib pulseaudio patchelf-native"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}:class-target = "${VIRTUAL-RUNTIME_bash}"

WEBOS_VERSION = "1.0.0-8_b1e75f002708602247d6a2e234d85a72008a3d6f"
PR = "r5"

inherit webos_library
inherit webos_cmake
inherit webos_machine_impl_dep
inherit webos_enhanced_submissions
inherit webos_public_repo
inherit webos_prebuilt_binaries

# git/lib/libsnowboy-detect.a git/lib/libtatlas.so are prebuilt binaries
# for hardfp arm only which in our builds is only the raspberrypi3 MACHINE
WEBOS_PREBUILT_BINARIES_FOR = "raspberrypi3"
COMPATIBLE_MACHINE:raspberrypi3-64 = "^$"

# Build for raspberrypi4
WEBOS_PREBUILT_BINARIES_FOR:append = " raspberrypi4"
COMPATIBLE_MACHINE:raspberrypi4-64 = "^$"

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

EXTRA_OECMAKE += "-DGOOGLEAPIS_PATH=${STAGING_INCDIR}/google"

do_configure:prepend() {
    # there is this silly SONAME in prebuilt libtatlas.so:
    # objdump -x image/usr/lib/libtatlas.so | grep SONAME
    #   SONAME               /usr/local/atlas/lib/libtatlas.so
    # which causes image/usr/lib/libgoogleassistant.so to need the same
    # silly path:
    # objdump -x image/usr/lib/libgoogleassistant.so | grep NEEDED.*tatlas
    #   NEEDED               /usr/local/atlas/lib/libtatlas.so
    # reset the SONAME before building libgoogleassistant.so
    patchelf --set-soname libtatlas.so ${S}/lib/libtatlas.so
}

do_install:append() {
    install -d ${D}${sysconfdir}/googleAssistant
    cp -r ${S}/tools/*.json ${D}${sysconfdir}/googleAssistant/
    cp -r ${S}/tools/*.sh ${D}${sysconfdir}/googleAssistant/
}

# ERROR: libgoogleassistant-1.0.0-4-r1 do_package_qa: QA Issue: ELF binary '/jenkins/mjansa/build-webos-thud/BUILD/work/raspberrypi3-webos-linux-gnueabi/libgoogleassistant/1.0.0-4-r1/packages-split/libgoogleassistant/usr/lib/libgoogleassistant.so.1.0.0' has relocations in .text [textrel]
# ERROR: libgoogleassistant-1.0.0-4-r1 do_package_qa: QA Issue: No GNU_HASH in the ELF binary /jenkins/mjansa/build-webos-thud/BUILD/work/raspberrypi3-webos-linux-gnueabi/libgoogleassistant/1.0.0-4-r1/packages-split/libgoogleassistant-dev/usr/lib/libtatlas.so, didn't pass LDFLAGS? [ldflags]
INSANE_SKIP:${PN} = "ldflags textrel"

# ERROR: libgoogleassistant-1.0.0-4-r1 do_package_qa: QA Issue: -dev package contains non-symlink .so: libgoogleassistant-dev path '/work/raspberrypi3-webos-linux-gnueabi/libgoogleassistant/1.0.0-4-r1/packages-split/libgoogleassistant-dev/usr/lib/libtatlas.so' [dev-elf]
# /usr/lib/libtatlas.so is really elf library, but there is also
# /usr/lib/libgoogleassistant.so -> libgoogleassistant.so.1
# which we need to explicitly add to PN-dev after
FILES_SOLIBSDEV = ""
FILES:${PN} += "${libdir}/libtatlas.so"
FILES:${PN}-dev += "${libdir}/libgoogleassistant.so"
