# Copyright (c) 2024 LG Electronics, Inc.

# LICENSE
CHROMIUM_LICENSE_CHKSUM = "file://src/LICENSE;md5=c408a301e3407c3803499ce9290515d6"
# oss-pkg-info.yaml
CHROMIUM_OSS_PKG_INFO_CHKSUM = "file://oss-pkg-info.yaml;md5=42bb8d47fa48b57155824ea9fa6595ad"

WEBOS_REPO_NAME = "chromium120"
WEBRUNTIME_REPO_VERSION = "120"
WEBOS_VERSION = "120.0.6099.269-14_ac6f7692bad38d790c69e3e82d9ee8ec0ab4b24e"

SRC_URI += " \
    file://0001-Use-shlex-instead-of-pipes.patch \
"
