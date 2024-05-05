# https://lists.openembedded.org/g/openembedded-core/message/199139
# api.vala:43:18: error: assignment to 'gchar **' {aka 'char **'} from incompatible pointer type 'const gchar * const*' {aka 'const char * const*'} [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
