# http://gecko.lge.com:8000/Errors/Details/832827
# pidgin-2.14.2/libpurple/protocols/bonjour/parser.c:200:9: error: initialization of 'void (*)(void *, const xmlError *)' {aka 'void (*)(void *, const struct _xmlError *)'} from incompatible pointer type 'void (*)(void *, xmlError *)' {aka 'void (*)(void *, struct _xmlError *)'} [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
