# Copyright (c) 2014-2022 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos7"

LICENSE += "& BSD & GPL-2.0-only & LGPL-2.1-only"

# Add missing dependency on BSD license for
LICENSE:eglibc-extra-nss = "GPL-2.0-only & LGPL-2.1-only & BSD"
LICENSE:${PN}-dbg = "GPL-2.0-only & LGPL-2.1-only & BSD"
LICENSE:${PN}-dev = "GPL-2.0-only & LGPL-2.1-only & BSD"
LICENSE:${PN} = "GPL-2.0-only & LGPL-2.1-only & BSD"
LICENSE:${PN}-staticdev = "GPL-2.0-only & LGPL-2.1-only & BSD"
LICENSE:${PN}-utils = "GPL-2.0-only & LGPL-2.1-only & BSD"
