# Copyright (c) 2021 LG Electronics, Inc.

EXTENDPRAUTO_append = "webos1"

# ERROR: influxdb-1.7.10-r0 do_package_qa: QA Issue: influxdb rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
# ERROR: influxdb-1.7.10-r0 do_package_qa: QA Issue: influxdb-dev rdepends on bash, but it isn't a build dependency, missing bash in DEPENDS or PACKAGECONFIG? [build-deps]
VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
RDEPENDS_${PN}-dev_append_class-target = " ${VIRTUAL-RUNTIME_bash}"
RDEPENDS_${PN}-dev_remove_class-target = "${@oe.utils.conditional('WEBOS_PREFERRED_PROVIDER_FOR_BASH', 'busybox', 'bash', '', d)}"
