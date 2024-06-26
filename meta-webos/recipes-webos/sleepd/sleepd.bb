# Copyright (c) 2012-2024 LG Electronics, Inc.

SUMMARY = "Sleep scheduling policy daemon"
AUTHOR = "Yogish S <yogish.s@lge.com>"
SECTION = "webos/base"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = " \
    file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10 \
    file://oss-pkg-info.yaml;md5=2bdfe040dcf81b4038370ae96036c519 \
"

DEPENDS = "nyx-lib luna-service2 json-c libxml2 sqlite3 glib-2.0"

WEBOS_VERSION = "2.0.0-17_3727287956ca9ac3c6dfb05c64a2df446fa61289"
PR = "r12"

inherit webos_component
inherit webos_public_repo
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_daemon
inherit webos_system_bus

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

inherit webos_systemd
WEBOS_SYSTEMD_SERVICE = "sleepd.service"

# http://gecko.lge.com:8000/Errors/Details/821709
# sleepd/2.0.0-17/git/src/pwrevents/shutdown.c:912:45: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/shutdown.c:964:45: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/shutdown.c:1020:47: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/shutdown.c:1095:47: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/shutdown.c:1151:43: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/shutdown.c:1192:43: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:83:47: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:145:39: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:214:39: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:269:47: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:578:45: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:630:45: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:698:45: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
# sleepd/2.0.0-17/git/src/pwrevents/suspend_ipc.c:752:45: error: passing argument 3 of 'get_json_string' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
