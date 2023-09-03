# Backport changes from:
# https://lists.openembedded.org/g/openembedded-devel/message/104699

# This is added by annonymous python in meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
# so even :remove operator is too weak for that
# DEPENDS:remove:virtclass-multilib-lib32 = "wayland wayland-protocols"
# DEPENDS:append = " ${MLPREFIX}wayland ${MLPREFIX}wayland-protocols"
python __anonymous() {
    deps = d.getVar("DEPENDS")
    mlprefix = d.getVar("MLPREFIX")
    deps = deps.replace(' wayland-protocols', ' %swayland-protocols' % mlprefix)
    deps = deps.replace(' wayland ', ' %swayland ' % mlprefix)
    d.setVar("DEPENDS", deps)
}
