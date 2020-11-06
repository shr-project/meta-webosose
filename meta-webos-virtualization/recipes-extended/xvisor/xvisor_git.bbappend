# Backport
# https://lists.yoctoproject.org/g/meta-virtualization/message/6014
FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-EMULATORS-Allow-Xvisor-to-compile-with-gcc-10.patch"

# and
# https://lists.yoctoproject.org/g/meta-virtualization/message/6016
# ERROR: xvisor-git-r0 do_package_qa: QA Issue: File /vmm.elf in package xvisor doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
# ERROR: xvisor-git-r0 do_package_qa: QA Issue: xvisor: ELF binary /vmm.elf has relocations in .text [textrel]
INSANE_SKIP_${PN} += "ldflags textrel"
