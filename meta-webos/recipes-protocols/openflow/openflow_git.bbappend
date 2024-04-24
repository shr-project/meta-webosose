# http://gecko.lge.com:8000/Errors/Details/832846
# lib/flow.c:213:48: error: initialization of 'const struct arp_eth_header *' from incompatible pointer type 'struct arp_header *' [-Wincompatible-pointer-types]
# lib/backtrace.c:126:32: error: passing argument 1 of 'backtrace' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
