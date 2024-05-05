# http://gecko.lge.com:8000/Errors/Details/833764
# tls_g.c:971:57: error: passing argument 4 of 'gnutls_fingerprint' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
