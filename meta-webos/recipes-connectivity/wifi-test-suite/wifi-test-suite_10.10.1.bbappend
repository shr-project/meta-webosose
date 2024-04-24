# http://gecko.lge.com:8000/Errors/Details/832852
# wfa_cmdproc.c:467:68: error: passing argument 3 of 'strtok_r' from incompatible pointer type [-Wincompatible-pointer-types]
# wfa_cs.c:4175:57: error: initialization of 'caStaGetEventDetails_t *' {aka 'struct ca_sta_get_event_details *'} from incompatible pointer type 'caStaMngServ_t *' {aka 'struct ca_sta_manage_service *'} [-Wincompatible-pointer-types]
CC += "-Wno-error=incompatible-pointer-types"
