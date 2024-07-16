
# FIXME-buildpaths!!!
# [WRP-10883] buildpath QA issues
# http://gecko.lge.com:8000/Errors/Details/895266
# ERROR: QA Issue: File /usr/libexec/installed-tests/fwupd/mtd-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/uf2-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/linux-swap-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/synaptics-mst-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/bcm57xx-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/acpi-phat-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/pxi-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/redfish-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/nvme-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/nitrokey-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/ata-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/ccgx-dmc-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/synaptics-rmi-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/synaptics-prometheus-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/fu-dfu-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/ccgx-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/uefi-dbx-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/wacom-usb-self-test in package fwupd-ptest contains reference to TMPDIR
# File /usr/libexec/installed-tests/fwupd/elantp-self-test in package fwupd-ptest contains reference to TMPDIR [buildpaths]
ERROR_QA:remove = "buildpaths"
WARN_QA:append = " buildpaths"
