# http://gecko.lge.com:8000/Errors/Details/832859
# openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing argument 2 of 'ifd_get_eventfd' from incompatible pointer type [-Wincompatible-pointer-types]
# openct-0.6.20/src/ifd/process.c:461:61: error: passing argument 4 of 'ct_tlv_get_opaque' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
