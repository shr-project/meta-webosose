# http://errors.yoctoproject.org/Errors/Details/766947/
# pidgin-sipe-1.25.0/src/core/sipe-xml.c:210:9: error: initialization of 'void (*)(void *, const xmlError *)' {aka 'void (*)(void *, const struct _xmlError *)'} from incompatible pointer type 'void (*)(void *, xmlError *)' {aka 'void (*)(void *, struct _xmlError *)'} [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
