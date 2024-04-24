# http://gecko.lge.com:8000/Errors/Details/832845
# usleep.c:47:43: error: passing argument 3 of 'poptGetContext' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
