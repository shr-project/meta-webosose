# Copyright (c) 2020-2022 LG Electronics, Inc.

EXTENDPRAUTO:append = "webosupdater1"

do_install[depends] += "virtual/kernel:do_webos_deploy_fixup"
