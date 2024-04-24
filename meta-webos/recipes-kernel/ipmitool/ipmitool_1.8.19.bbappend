# http://gecko.lge.com:8000/Errors/Details/832849
# git/lib/ipmi_fru.c:1556:41: error: initialization of 'struct fru_multirec_mgmt *' from incompatible pointer type 'struct fru_multirect_mgmt *' [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
