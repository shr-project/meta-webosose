# Copyright (c) 2019-2024 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosvirt2"

RDEPENDS:${PN}:append = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'docker-moby', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'docker-simple-webserver', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'docker-compose', '', d)} \
"
