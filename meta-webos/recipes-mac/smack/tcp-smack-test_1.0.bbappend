# Fixed properly in https://lists.yoctoproject.org/g/yocto/message/63171
# http://gecko.lge.com:8000/Errors/Details/832858
# tcp_client.c:55:16: error: implicit declaration of function 'atoi' [-Wimplicit-function-declaration]
CC += "-Wno-error=implicit-function-declaration"

# https://lists.yoctoproject.org/g/yocto/message/63172
S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"
