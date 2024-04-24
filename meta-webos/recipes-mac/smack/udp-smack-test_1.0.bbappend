# Fixed properly in https://lists.yoctoproject.org/g/yocto/message/63171
# http://gecko.lge.com:8000/Errors/Details/832851
# udp_client.c:41:16: error: implicit declaration of function 'atoi' [-Wimplicit-function-declaration]
# udp_client.c:51:12: error: implicit declaration of function 'fsetxattr' [-Wimplicit-function-declaration]
# udp_client.c:66:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
CC += "-Wno-error=implicit-function-declaration"

# https://lists.yoctoproject.org/g/yocto/message/63172
S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"
