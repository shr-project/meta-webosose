# http://gecko.lge.com:8000/Errors/Details/832866
# mcpp-2.7.2/src/expand.c:713:21: error: assignment to 'char *' from incompatible pointer type 'LOCATION *' {aka 'struct location *'} [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
