# http://gecko.lge.com:8000/Errors/Details/832864
# pathexec_run.c:19:17: error: passing argument 2 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
# pathexec_run.c:19:22: error: passing argument 3 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
# pathexec_run.c:36:18: error: passing argument 2 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types]
# pathexec_run.c:36:23: error: passing argument 3 of 'execve' from incompatible pointer type [-Wincompatible-pointer-types] 
CC += "-Wno-error=incompatible-pointer-types"
