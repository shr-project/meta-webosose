# http://gecko.lge.com:8000/Errors/Details/833769
# scsirastools-1.6.6/src/sgdiag.c:238:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgdiag.c:697:10: error: passing argument 1 of 'time' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgdiag.c:699:30: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgdiag.c:733:10: error: passing argument 1 of 'time' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgdefects.c:214:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgmode.c:290:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgdiskmon.c:1278:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgdskfl.c:318:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgdskfl.c:829:37: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgraidmon.c:1641:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
# scsirastools-1.6.6/src/sgsafte.c:1298:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
