# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosrpi1"

FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append:webos = " \
     file://0001-Disable-4-way-handshake-offloading-for-WPA-WPA2-PSK.patch \
"
