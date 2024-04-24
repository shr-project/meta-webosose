# http://gecko.lge.com:8000/Errors/Details/832839
# cdrkit/1.1.11/cdrkit-1.1.11/genisoimage/eltorito.c:399:41: error: passing argument 1 of 'set_721' from incompatible pointer type [-Wincompatible-pointer-types]
# cdrkit/1.1.11/cdrkit-1.1.11/genisoimage/eltorito.c:422:25: error: passing argument 1 of 'set_721' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
