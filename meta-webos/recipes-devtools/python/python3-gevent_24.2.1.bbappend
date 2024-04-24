# http://gecko.lge.com:8000/Errors/Details/832834
# src/gevent/queue.c:11894:83: error: passing argument 1 of '__pyx_vtabptr_6gevent_14_gevent_cqueue_UnboundQueue->__pyx_base.put' from incompatible pointer type [-Wincompatible-pointer-types]
# src/gevent/queue.c:11894:114: error: passing argument 4 of '__pyx_vtabptr_6gevent_14_gevent_cqueue_UnboundQueue->__pyx_base.put' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
