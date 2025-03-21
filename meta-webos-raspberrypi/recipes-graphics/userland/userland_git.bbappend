# Copyright (c) 2017-2025 LG Electronics, Inc.

EXTENDPRAUTO:append:rpi = "webosrpi7"

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS:${PN}:append:class-target:rpi = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS:${PN}:remove:class-target:rpi = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"

# We use vc4graphics so need libegl-mesa provider for:
# RDEPENDS:${PN} += "${@bb.utils.contains("MACHINE_FEATURES", "vc4graphics", "libegl-mesa", "", d)}"
inherit features_check
ANY_OF_DISTRO_FEATURES:rpi = "vulkan opengl"

# http://gecko.lge.com:8000/Errors/Details/1140017
# userland/20230419/git/interface/vmcs_host/vc_vchi_gpuserv.c:204:13: error: too many arguments to function 'c->func'; expected 0, have 1
# userland/20230419/git/interface/vchiq_arm/vchiq_lib.c:534:1: error: conflicting types for 'vchiq_bulk_receive_handle'; have 'VCHIQ_STATUS_T(VCHIQ_SERVICE_HANDLE_T,  VCHI_MEM_HANDLE_T,  void *, int,  void *, VCHIQ_BULK_MODE_T,  int (*)(void))' {aka 'VCHIQ_STATUS_T(unsigned int,  int,  void *, int,  void *, VCHIQ_BULK_MODE_T,  int (*)(void))'}
CFLAGS += "-std=gnu17"
