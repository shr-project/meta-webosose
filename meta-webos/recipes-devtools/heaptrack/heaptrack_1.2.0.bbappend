# http://gecko.lge.com:8000/Errors/Details/832843
#     buildResult:
#       variable: "LIBUNWIND_HAS_UNW_BACKTRACE"
#       cached: true
#       stdout: |
#         Change Dir: '/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/build/CMakeFiles/CMakeScratch/TryCompile-kguYrO'
# 
#         Run Build Command(s): ninja -v cmTC_51d86
#         [1/2] ccache /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/aarch64-webos-linux-gcc --sysroot=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot -DLIBUNWIND_HAS_UNW_BACKTRACE  -mcpu=cortex-a72+crc -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type  --sysroot=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/git=/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/git=/usr/src/debug/heaptrack/1.2.0  -fmacro-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/build=/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/build=/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot=  -fmacro-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot=  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot-native= -o CMakeFiles/cmTC_51d86.dir/src.c.o -c /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/build/CMakeFiles/CMakeScratch/TryCompile-kguYrO/src.c
#         FAILED: CMakeFiles/cmTC_51d86.dir/src.c.o
#         ccache /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/aarch64-webos-linux-gcc --sysroot=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot -DLIBUNWIND_HAS_UNW_BACKTRACE  -mcpu=cortex-a72+crc -mbranch-protection=standard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type  --sysroot=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/git=/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/git=/usr/src/debug/heaptrack/1.2.0  -fmacro-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/build=/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/build=/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot=  -fmacro-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot=  -fdebug-prefix-map=/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot-native= -o CMakeFiles/cmTC_51d86.dir/src.c.o -c /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/build/CMakeFiles/CMakeScratch/TryCompile-kguYrO/src.c
#         src.c: In function 'main':
#         src.c:3:43: error: passing argument 1 of 'unw_backtrace' from incompatible pointer type [-Wincompatible-pointer-types]
#             3 | int main() { void* buf[10]; unw_backtrace(&buf, 10); return 0; }
#               |                                           ^~~~
#               |                                           |
#               |                                           void * (*)[10]
#         In file included from ../../../../recipe-sysroot/usr/include/libunwind-aarch64.h:232,
#                          from ../../../../recipe-sysroot/usr/include/libunwind-64.h:7,
#                          from ../../../../recipe-sysroot/usr/include/libunwind.h:27,
#                          from src.c:2:
#         ../../../../recipe-sysroot/usr/include/libunwind-common.h:290:27: note: expected 'void **' but argument is of type 'void * (*)[10]'
#           290 | extern int unw_backtrace (void **, int);
#               |                           ^~~~~~~
#         ninja: build stopped: subcommand failed.
# 
#       exitCode: 1
# 
CFLAGS += "-Wno-error=incompatible-pointer-types"
