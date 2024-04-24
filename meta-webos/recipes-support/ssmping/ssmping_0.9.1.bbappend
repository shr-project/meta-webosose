# http://gecko.lge.com:8000/Errors/Details/832850
# ssmping.c:55:51: error: passing argument 3 of 'getsockname' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
