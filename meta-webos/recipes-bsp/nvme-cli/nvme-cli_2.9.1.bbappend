# http://gecko.lge.com:8000/Errors/Details/833774
# http://gecko.lge.com:8000/Errors/Details/846108
# git/plugins/virtium/virtium-nvme.c:205:63: error: passing argument 1 of 'localtime' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
