SUMMARY = "ARM Neural Network SDK"
DESCRIPTION = "Linux software and tools to enable machine learning workloads on power-efficient devices"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"

# Compute branch info from ${PV} as Base PV...
BPV = "${@'_'.join(d.getVar('PV').split('.')[0:2])}"

BRANCH = "branches/armnn_${BPV}"

SRC_URI = " \
    git://github.com/ARM-software/armnn.git;branch=${BRANCH};protocol=https \
    file://0001-webos-build-error-fix-for-21.11.patch \
    file://0003-const_tensor_exception_fixed.patch \
    file://0004-exception-case-pass-to-skipnode.patch \
    file://armnn-tflite.pc.in \
    file://armnn-delegate.pc.in \
"

SRCREV = "v${PV}"
#SRCREV = "5e9965cae1cc6162649910f423ebd86001fc1931"

PR = "r0"

S = "${WORKDIR}/git"

inherit cmake

DEPENDS = " \
    boost \
    protobuf \
    stb \
    half \
    xxd-native \
    arm-compute-library \
"

RDEPENDS_WEBOS = ""

RDEPENDS:${PN}   = " \
    arm-compute-library \
    protobuf \
    boost \
    ${RDEPENDS_WEBOS} \
"

PACKAGECONFIG += "ref opencl tensorflow tensorflow-lite tensorflow-lite-delegate"
PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', 'neon', '', d)}"
PACKAGECONFIG += "${@bb.utils.contains('TARGET_ARCH', 'arm', 'neon', '', d)}"

PACKAGECONFIG[neon] = " \
    -DARMCOMPUTENEON=1, \
    -DARMCOMPUTENEON=0 \
"

PACKAGECONFIG[opencl] = " \
    -DARMCOMPUTECL=1 \
    -DFLATC=${STAGING_BINDIR_NATIVE}/flatc \
    -DOPENCL_INCLUDE=${STAGING_INCDIR}, \
    -DARMCOMPUTECL=0, \
    opencl-headers opencl-clhpp flatbuffers flatbuffers-native \
"

PACKAGECONFIG[tensorflow] = " \
    -DBUILD_TF_PARSER=1 \
    -DTF_GENERATED_SOURCES=${STAGING_DATADIR}/armnn-tensorflow, \
    -DBUILD_TF_PARSER=0, \
    protobuf-native flatbuffers armnn-tensorflow \
"

PACKAGECONFIG[tensorflow-lite] = " \
    -DTF_LITE_SCHEMA_INCLUDE_PATH=${STAGING_DATADIR}/armnn-tensorflow-lite \
    -DTF_LITE_GENERATED_PATH=${STAGING_DATADIR}/armnn-tensorflow-lite \
    -DBUILD_TF_LITE_PARSER=1, \
    -DBUILD_TF_LITE_PARSER=0, \
    flatbuffers armnn-tensorflow \
"

PACKAGECONFIG[tensorflow-lite-delegate] = " \
    -DBUILD_ARMNN_TFLITE_DELEGATE=1, \
    -DBUILD_ARMNN_TFLITE_DELEGATE=0, \
    tensorflow-lite \
"

PACKAGECONFIG[unit-tests] = " \
    -DBUILD_UNIT_TESTS=1, \
    -DBUILD_UNIT_TESTS=0 \
"

PACKAGECONFIG[tests] = " \
    -DBUILD_TESTS=1, \
    -DBUILD_TESTS=0 \
"

PACKAGECONFIG[ref] = " \
    -DARMNNREF=1, \
    -DARMNNREF=0 \
"

EXTRA_OECMAKE += " \
    -DSHARED_BOOST=1 \
    -DHALF_INCLUDE=${STAGING_DIR_HOST} \
"

ARMNN_INSTALL_DIR = "${bindir}/${P}"

do_install:append() {
    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"

    if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
        install -d ${D}${ARMNN_INSTALL_DIR}
        find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${ARMNN_INSTALL_DIR} \;
        chrpath -d ${D}${ARMNN_INSTALL_DIR}/*
    fi

    if ${@bb.utils.contains('PACKAGECONFIG', 'unit-tests', 'true', 'false', d)}; then
        install -d ${D}${ARMNN_INSTALL_DIR}
        cp $CP_ARGS ${B}/UnitTests ${D}${ARMNN_INSTALL_DIR}
    fi

    if ${@bb.utils.contains('PACKAGECONFIG', 'tensorflow-lite-delegate', 'true', 'false', d)}; then
        for lib in ${WORKDIR}/build/delegate/*.so
        do
            cp $CP_ARGS $lib ${D}${libdir}
        done

        # install delegate headers
        install -d ${D}${includedir}/armnn/delegate
        cd "${S}/delegate/include"
        for file in $(find . -name '*.h*'); do
            cp $CP_ARGS "${file}" "${D}${includedir}/armnn/delegate"
        done

        #install delegate cmake module
        install -d ${D}${libdir}
        install -d ${D}${libdir}/cmake
        install -d ${D}${libdir}/cmake/armnn
        cp $CP_ARGS "${B}/delegate/ArmnnDelegateConfig.cmake" "${D}${libdir}/cmake/armnn"
        cp $CP_ARGS "${B}/delegate/CMakeFiles/Export/lib/ArmnnDelegateTargets.cmake" "${D}${libdir}/cmake/armnn"
        cp $CP_ARGS "${B}/delegate/CMakeFiles/Export/lib/ArmnnDelegateTargets-release.cmake" "${D}${libdir}/cmake/armnn"

        #remove duplicate files
        rm ${D}${libdir}/ArmnnDelegate*.cmake

        #install pkgconfig
        install -d ${D}${libdir}/pkgconfig
        install -m 0644 ${WORKDIR}/armnn-tflite.pc.in ${D}${libdir}/pkgconfig/armnn-tflite.pc
        sed -i 's:@version@:${PV}:g
            s:@libdir@:${libdir}:g
            s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/armnn-tflite.pc

        install -m 0644 ${WORKDIR}/armnn-delegate.pc.in ${D}${libdir}/pkgconfig/armnn-delegate.pc
        sed -i 's:@version@:${PV}:g
            s:@libdir@:${libdir}:g
            s:@includedir@:${includedir}:g' ${D}${libdir}/pkgconfig/armnn-delegate.pc
    fi


}

CXXFLAGS += "-fopenmp -I${STAGING_DIR_HOST}/usr"
LIBS += "-larmpl_lp64_mp"

FILES:${PN}-dev = ""

INSANE_SKIP:${PN} = "dev-so"
INSANE_SKIP:${PN}-dev += "dev-elf"
FILES:${PN} += "${libdir}/*"
FILES:${PN}-dev += "${includedir}/* ${libdir}/cmake/armnn/* ${libdir}/pkgconfig/*.pc ${bindir}/*"
