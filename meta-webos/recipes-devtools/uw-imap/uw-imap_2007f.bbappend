# http://gecko.lge.com:8000/Errors/Details/832828
# unix.c:235:21: error: passing argument 2 of 'utime' from incompatible pointer type [-Wincompatible-pointer-types]
# unix.c:1002:15: error: passing argument 2 of 'utime' from incompatible pointer type [-Wincompatible-pointer-types]
# unix.c:1163:15: error: passing argument 2 of 'utime' from incompatible pointer type [-Wincompatible-pointer-types]
# unix.c:1428:40: error: passing argument 2 of 'utime' from incompatible pointer type [-Wincompatible-pointer-types]
# unix.c:2254:33: error: passing argument 2 of 'utime' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
