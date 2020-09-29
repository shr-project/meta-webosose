# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "${@bb.utils.contains('DISTRO_FEATURES', 'smack', 'smack2', '', d)}"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = "\
    ${@bb.utils.contains('DISTRO_FEATURES', 'smack', 'file://0001-run_app_shell-add-SMACK-labeling-based-on-AppID_79.patch', '', d)} \
"
