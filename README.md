Don't use.

Walnascar is last version which might build fine from this fork, but
it's unknown if the upstream meta-webosose will be updated.

Since the CMake-4 upgrade the cmake-modules-webos-native needs major
update as well as many webOS specific components which use it.

There are too many failures already and nobody actively working
on resolving them. I no longer work on webOS project as well.

```
meta-webos-raspberrypi/recipes-bsp/libbootctrl/libbootctrl.bb:do_configure) failed with exit code '1'
meta-webos/recipes-devtools/jsoncpp/jsoncpp-clang_1.9.6.bb:do_configure) failed with exit code '1'
meta-webos/recipes-test/googletest/googletest-clang_1.16.0.bb:do_configure) failed with exit code '1'
meta-webos/recipes-webos/bluetooth/bluetooth-sil-api.bb:do_package) failed with exit code '1'
meta-webos/recipes-webos/jemalloc/jemalloc.bb:do_configure) failed with exit code '1'
meta-webos/recipes-webos/libpbnjson/libpbnjson.bb:do_configure) failed with exit code '1'
meta-webos/recipes-webos/libpbnjson/libpbnjson-clang.bb:do_configure) failed with exit code '1'
meta-webos/recipes-webos/librolegen/librolegen.bb:do_configure) failed with exit code '1'
meta-webos/recipes-webos/libsandbox/libsandbox.bb:do_configure) failed with exit code '1'
meta-webos/recipes-webos/pmloglib/pmloglib-private.bb:do_package) failed with exit code '1'
build/oe-core/meta/recipes-devtools/rust/libstd-rs_1.88.0.bb:do_compile) failed with exit code '1'
build/oe-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.5.bb:do_patch) failed with exit code '1'
virtual:native:meta-webos/recipes-webos/libpbnjson/libpbnjson.bb:do_configure) failed with exit code '1'
```
