LICENSE = "CLOSED"
inherit deploy

DEPENDS = "rpi-bootfiles"
SRC_URI += "file://splash.bmp"

PACKAGES = "${PN}"  
FILES:${PN} = "/boot/splash.bmp"

do_install() {
    install -d ${D}/boot
    install -m 0644 ${WORKDIR}/splash.bmp ${D}/boot/splash.bmp
}

do_deploy() {
    install -d ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}
    install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/splash.bmp
}
addtask deploy before do_build after do_install

