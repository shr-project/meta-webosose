# http://gecko.lge.com:8000/Errors/Details/833777
# lstat64.c:65:14: error: passing argument 1 of 'time' from incompatible pointer type [-Wincompatible-pointer-types]
# bstat.c:18:19: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
