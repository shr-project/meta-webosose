# Copyright (c) 2014-2022 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos4"

PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF,libedit"
