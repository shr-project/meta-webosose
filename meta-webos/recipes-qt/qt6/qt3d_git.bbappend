# Copyright (c) 2023 LG Electronics, Inc.

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
# https://codereview.qt-project.org/c/yocto/meta-qt6/+/477944
SRC_URI:append = " file://0001-Use-unqualified-uint32_t-everywhere-in-FBXBinaryToke.patch;patchdir=src/3rdparty/assimp/src"
