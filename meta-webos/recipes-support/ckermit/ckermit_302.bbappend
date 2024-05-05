# http://gecko.lge.com:8000/Errors/Details/833773
# ckutio.c:12057:10: error: passing argument 1 of 'time' from incompatible pointer type [-Wincompatible-pointer-types]
# ckutio.c:12058:20: error: passing argument 1 of 'localtime' from incompatible pointer type [-Wincompatible-pointer-types]
# ckufio.c:5043:32: error: passing argument 1 of 'localtime' from incompatible pointer type [-Wincompatible-pointer-types]
# ckufio.c:5263:32: error: passing argument 1 of 'localtime' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
