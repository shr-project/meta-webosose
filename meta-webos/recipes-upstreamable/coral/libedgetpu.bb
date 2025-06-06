DESCRIPTION = "Edge TPU runtime library(libedgetpu)"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"

PV = "grouper"
PR = "r11"

SRCREV = "3164995622300286ef2bb14d7fdc2792dae045b7"

SRC_URI = " \
    git://github.com/google-coral/libedgetpu.git;name=libedgetpu;branch=master;protocol=https \
    file://0001-allocated_buffer.h-include-stddef.h.patch \
    file://0002-Makefile-modify.patch \
    file://0003-Fix-return-type-issues.patch \
    file://0004-Makefile-fix-race-condition.patch \
    file://0005-Fix-build-with-gcc-13.patch \
    file://0006-makefile_build-Makefile-use-C-17.patch \
    file://0007-makefile_build-Makefile-drop-absl_flags.patch \
    file://0008-makefile_build-Makefile-drop-fuse-ld-gold.patch \
    file://0009-Fix-build-with-gcc-15.patch \
    file://edgetpu.pc.in \
    file://edgetpu-max.pc.in \
"

S = "${WORKDIR}/git"
B = "${WORKDIR}/git/makefile_build"

DEPENDS = " \
    flatbuffers-native \
    vim-native \
    flatbuffers \
    tensorflow-lite \
    abseil-cpp \
    libusb1 \
"

EXTRA_OEMAKE = "TFROOT=${STAGING_INCDIR}"

do_install:append() {
    # install libedgetpu1-std(throttled) and libedgetpu1-max(direct, max frequency)
    install -d ${D}/${libdir}
    install -m 0755 ${S}/out/throttled/k8/libedgetpu.so.1 ${D}/${libdir}
    ln -snf libedgetpu.so.1 ${D}/${libdir}/libedgetpu.so

    install -m 0755 ${S}/out/direct/k8/libedgetpu.so.1 ${D}/${libdir}/libedgetpu_max.so.1
    ln -snf libedgetpu_max.so.1 ${D}/${libdir}/libedgetpu_max.so

    install -d ${D}/etc/udev/rules.d/
    install -m 644 ${S}/debian/edgetpu-accelerator.rules ${D}/etc/udev/rules.d/99-edgetpu-accelerator.rules

    # install header file
    install -d ${D}/${includedir}
    install -m 755 ${S}/tflite/public/edgetpu.h ${D}/${includedir}

    # install pkgconfig file
    install -d ${D}${libdir}/pkgconfig
    install -m 0644 ${UNPACKDIR}/edgetpu.pc.in ${D}${libdir}/pkgconfig/edgetpu.pc
    sed -i 's:@version@:${PV}:g
        s:@libdir@:${libdir}:g
        s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/edgetpu.pc

    install -m 0644 ${UNPACKDIR}/edgetpu-max.pc.in ${D}${libdir}/pkgconfig/edgetpu-max.pc
    sed -i 's:@version@:${PV}:g
        s:@libdir@:${libdir}:g
        s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/edgetpu-max.pc
}

BBCLASSEXTEND = "native nativesdk"

# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895260
# ERROR: QA Issue: File /usr/lib/.debug/libedgetpu_max.so.1 in package libedgetpu-dbg contains reference to TMPDIR
# File /usr/lib/.debug/libedgetpu.so.1 in package libedgetpu-dbg contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
