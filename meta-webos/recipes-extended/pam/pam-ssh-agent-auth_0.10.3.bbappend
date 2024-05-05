# http://gecko.lge.com:8000/Errors/Details/833770
# ssh-rsa.c:59:24: error: passing argument 1 of 'EVP_DigestInit' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-rsa.c:60:26: error: passing argument 1 of 'EVP_DigestUpdate' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-rsa.c:61:25: error: passing argument 1 of 'EVP_DigestFinal' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-ecdsa.c:76:18: error: passing argument 1 of 'DSA_SIG_get0' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-ecdsa.c:76:23: error: passing argument 2 of 'DSA_SIG_get0' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-ecdsa.c:76:27: error: passing argument 3 of 'DSA_SIG_get0' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-ecdsa.c:148:18: error: passing argument 1 of 'DSA_SIG_get0' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-ecdsa.c:148:23: error: passing argument 2 of 'DSA_SIG_get0' from incompatible pointer type [-Wincompatible-pointer-types]
# ssh-ecdsa.c:148:27: error: passing argument 3 of 'DSA_SIG_get0' from incompatible pointer type [-Wincompatible-pointer-types]
CFLAGS += "-Wno-error=incompatible-pointer-types"
