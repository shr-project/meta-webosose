# http://gecko.lge.com:8000/Errors/Details/832844
# avro-c/1.11.3/git/lang/c/examples/quickstop.c:123:61: error: passing argument 3 of 'first_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
# avro-c/1.11.3/git/lang/c/examples/quickstop.c:127:60: error: passing argument 3 of 'last_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
# avro-c/1.11.3/git/lang/c/examples/quickstop.c:131:61: error: passing argument 3 of 'phone_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
