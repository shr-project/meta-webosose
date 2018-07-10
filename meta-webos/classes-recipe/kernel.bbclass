# Copyright (c) 2015-2024 LG Electronics, Inc.
#
# packagegroup
#
# Intercept the upstream kernel.bbclass
#

require ${COREBASE}/meta/classes-recipe/kernel.bbclass

do_deploy:append() {
    # The .bin-s are of no use to us.
    for type in ${KERNEL_IMAGETYPES} ; do
        rm -vf ${DEPLOYDIR}/${type}${KERNEL_IMAGE_LINK_NAME}.bin
    done
}
