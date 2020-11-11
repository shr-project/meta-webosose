# Copyright (c) 2015-2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos10"

# Assign to PE, because empty PKGE in KERNEL_IMAGE_NAME causes two hyphens.
PE = "1"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_qemux86 = " file://crypto.cfg \
                           file://my_gfx.cfg \
                           file://vbox_gfx.cfg \
                           file://sound.cfg \
                           file://enable_uinput.cfg \
                           file://network_testing.cfg \
                           file://0001-change-keymax-value.patch \
                           file://file_system.cfg \
                           file://bluetooth_ext.cfg \
"

KERNEL_FEATURES_append_qemux86 = " features/bluetooth/bluetooth-usb.scc"

# needed to build gator
KERNEL_FEATURES_append_qemux86 = " features/profiling/profiling.cfg"

KERNEL_MODULE_AUTOLOAD_append_qemux86 = "\
        vboxguest \
        snd-pcm \
        ac97_bus \
        snd-ac97-codec \
        snd-intel8x0 \
"
KERNEL_MODULE_AUTOLOAD_append_qemux86-64 = "\
        vboxguest \
        snd-pcm \
        ac97_bus \
        snd-ac97-codec \
        snd-intel8x0 \
"
