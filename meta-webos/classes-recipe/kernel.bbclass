# Copyright (c) 2015-2025 LG Electronics, Inc.
#
# packagegroup
#
# Intercept the upstream kernel.bbclass so that when there's a webos_deploy_fixup
# task.
#

require ${COREBASE}/meta/classes-recipe/kernel.bbclass

inherit webos_deploy

do_webos_deploy_fixup:prepend() {
    [ -e       ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_NAME}.bin ] && \
        ln -vf ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_NAME}.bin \
               ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_LINK_NAME}.bin
    [ -e       ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${KERNEL_IMAGE_NAME}.bin ] && \
        ln -vf ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${KERNEL_IMAGE_NAME}.bin \
               ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}
    [ -e       ${DEPLOY_DIR_IMAGE}/modules-${MODULE_TARBALL_NAME}.tgz ] && \
        ln -vf ${DEPLOY_DIR_IMAGE}/modules-${MODULE_TARBALL_NAME}.tgz \
               ${DEPLOY_DIR_IMAGE}/modules-${MODULE_TARBALL_LINK_NAME}.tgz
}
