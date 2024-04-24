# http://gecko.lge.com:8000/Errors/Details/832847
# sblim-sfcc-2.2.8/TEST/v2test_ec.c:86:31: error: passing argument 1 of 'showClass' from incompatible pointer type [-Wincompatible-pointer-types]
# sblim-sfcc-2.2.8/TEST/v2test_ein.c:96:36: error: passing argument 1 of 'showObjectPath' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
