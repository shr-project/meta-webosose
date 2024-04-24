# http://gecko.lge.com:8000/Errors/Details/888159
# src/asymmetric_cipher.c:422:58: error: passing argument 4 of 'p11prov_tls_constant_time_depadding' from incompatible pointer type [-Wincompatible-pointer-types]
# reported in:
# https://lists.openembedded.org/g/openembedded-devel/message/111283
CFLAGS += "-Wno-error=incompatible-pointer-types"
