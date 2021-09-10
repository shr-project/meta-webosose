# Copyright (c) 2021 LG Electronics, Inc.

EXTENDPRAUTO:append = "webos1"

# enable old API to fix http://gecko.lge.com/Builds/Details/672098
# luna-surfacemanager, qtwayland-webos, qml-webos-components, audiod, webruntime, pmtrace are all failing like:
# TOPDIR/BUILD/work/qemux86-webos-linux/luna-surfacemanager/2.0.0-358-r51/recipe-sysroot/usr/include/lttng/tracepoint-event.h:67:10: error: #include expects "FILENAME" or <FILENAME>
#    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
#       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

# TOPDIR/BUILD/work/qemux86-webos-linux/pmtrace/1.0.0-9-r11/git/src/libmemtracker/liblttng-ust-mtrace-malloc/./ust_mtrace_malloc.h:41:9: error: static assertion failed: "Non-integer type `bt` not supported as element of LTTNG_UST_FIELD_ARRAY or LTTNG_UST_FIELD_SEQUENCE"
#    41 |         ctf_sequence(void *, bt, bt, size_t, depth)
#       |         ^~~~~~~~~~~~

# TOPDIR/BUILD/work/qemux86-webos-linux/pmtrace/1.0.0-9-r11/git/src/libmemtracker/liblttng-ust-mtrace-malloc/./ust_mtrace_malloc.h:36:1: error: expected expression before ')' token
#    36 | TRACEPOINT_EVENT(mtrace_malloc, malloc,
#       | ^~~~~~~~~~~~~~~~
CFLAGS += "-DLTTNG_UST_COMPAT_API_VERSION=0"
