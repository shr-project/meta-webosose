# Copyright (c) 2022-2023 LG Electronics, Inc.

WEBOS_VERSION = "94.0.4606.128-42_ca7be9386e921a320507174144ff758a75f886cc"

# 9.4.146.25-chromium94.7
SRCREV_v8 = "9e0278b87b7e59dd91364aaef32fd5fc31789bd4"

# http://gpro.lge.com/c/webosose/chromium94/+/363094 avcodec/x86/mathops: clip constants used with shift instructions within inline assembly
SRC_URI += "file://0001-avcodec-x86-mathops-clip-constants-used-with-shift-i.patch"

# http://gpro.lge.com/c/webosose/chromium94/+/373211 Disable usage of `__is_cpp17_contiguous_iterator` until libc++ rolls.
SRC_URI += "file://0001-Disable-usage-of-__is_cpp17_contiguous_iterator-unti-94.patch"
