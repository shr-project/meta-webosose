# http://gecko.lge.com:8000/Errors/Details/832855
# git/src/libzsync/zsync.c:445:18: error: returning 'char **' from a function with incompatible return type 'const char * const*' [-Wincompatible-pointer-types]
# git/src/libzsync/zsync.c:450:18: error: returning 'char **' from a function with incompatible return type 'const char * const*' [-Wincompatible-pointer-types]
# git/src/libzsync/zsync.c:932:43: error: passing argument 4 of 'zsync_configure_zstream_for_zdata' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
