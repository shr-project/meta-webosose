# Copyright (c) 2020 LG Electronics, Inc.

EXTENDPRAUTO_append = "webosupdater1"

do_install[depends] += "virtual/kernel:do_webos_deploy_fixup"
