# http://gecko.lge.com:8000/Errors/Details/832868
# git/Port-linux/interface.c:118:18: error: assignment to '__caddr_t' {aka 'char *'} from incompatible pointer type 'struct ethtool_value *' [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
