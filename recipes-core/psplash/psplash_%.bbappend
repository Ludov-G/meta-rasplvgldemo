# Add the file path to the FILESEXTRAPATHS variable
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://my-psplash-raspberrypi-img.h"
SRC_URI += "file://my-framebuf.conf"

ROOTFS_POSTPROCESS_COMMAND += "remove_framebuf_conf;"

remove_framebuf_conf() {
    #echo "Executing do_rootfs: removing the framebuf.conf file from the filesystem"
    rm -f ${IMAGE_ROOTFS}/usr/lib/systemd/system/psplash-start.service.d/framebuf.conf
    rm -f ${D}${systemd_system_unitdir}/psplash-start.service.d/framebuf.conf
}

do_configure:append(){
    cp ${WORKDIR}/my-psplash-raspberrypi-img.h ${WORKDIR}/build/psplash-poky-img.h
    cp ${WORKDIR}/my-psplash-raspberrypi-img.h ${S}/../psplash-raspberrypi-img.h
}

do_install:append:rpi() {
    install -m 0755 ${B}/psplash ${D}${bindir}/psplash
    cp ${WORKDIR}/my-framebuf.conf ${S}/../framebuf.conf  
}

do_rootfs:append:rpi() {
    #echo "Executing do_rootfs: removing the framebuf.conf file from the filesystem"
    rm -f ${D}${systemd_system_unitdir}/psplash-start.service.d/framebuf.conf
    rm -f ${IMAGE_ROOTFS}/usr/lib/systemd/system/psplash-start.service.d/framebuf.conf
    rm -f ${IMAGE_ROOTFS}/usr/lib/systemd/system/psplash-start.service.d/framebuf.conf
}



