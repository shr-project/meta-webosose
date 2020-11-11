# Copyright (c) 2020 LG Electronics, Inc.

SUMMARY = "pmscore handles device states"
AUTHOR = "Abhsiehk Srivastava <abhishek.srivastava@lge.com>"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
SECTION = "webos/libs"

DEPENDS = "luna-service2 glib-2.0 pmloglib libpbnjson nyx-lib"

WEBOS_VERSION = "1.0.0-4_83b5aad3ec926726b162bcbce913d3fc41a24b50"
PR = "r0"

inherit webos_component
inherit webos_enhanced_submissions
inherit webos_cmake
inherit webos_daemon
inherit webos_system_bus
inherit webos_public_repo
inherit webos_library

SRC_URI = "${WEBOSOSE_GIT_REPO_COMPLETE}"
S = "${WORKDIR}/git"

# http://caprica.lgsvl.com:8080/Errors/Details/1092306
# 1.0.0-5-r0/git/include/public/pmscore/PmsLogging.h:63:28: error: format not a string literal and no format arguments [-Werror=format-security]
#              pLogger->Debug(buffer);
#                             ^~~~~~
# ...
SECURITY_STRINGFORMAT = ""
