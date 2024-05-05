# http://gecko.lge.com:8000/Errors/Details/833772
# sblim-sfcb-1.4.9/trace.c:214:18: error: passing argument 1 of 'gmtime_r' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
