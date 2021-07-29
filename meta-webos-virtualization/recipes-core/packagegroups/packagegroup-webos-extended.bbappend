# Copyright (c) 2019-2020 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosvirt1"

RDEPENDS:${PN}:append = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'docker-moby', '', d)} \
"
