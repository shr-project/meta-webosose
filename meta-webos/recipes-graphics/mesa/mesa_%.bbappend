# Copyright (c) 2017-2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos6"

# Add gallium, gallium-llvmpipe, opengl and enable wayland even without wayland in DISTRO_FEATURES
PACKAGECONFIG_qemuall = "opengl gbm egl gles dri wayland gallium gallium-llvm"

# Add virgl gallium driver
GALLIUMDRIVERS_qemux86 = "virgl,svga"
GALLIUMDRIVERS_LLVM_qemux86 = "virgl,svga"
GALLIUMDRIVERS_qemux86-64 = "virgl,svga"
GALLIUMDRIVERS_LLVM_qemux86-64 = "virgl,svga"
# svga fails to build for qemuarm:
# http://caprica.lgsvl.com:8080/Errors/Details/1472308
GALLIUMDRIVERS_qemuarm = "virgl"
GALLIUMDRIVERS_LLVM_qemuarm = "virgl"
DRIDRIVERS_qemuall = "swrast"
