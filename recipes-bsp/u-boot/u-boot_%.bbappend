FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://rpi_arm64_defconfig.patch"
#SRC_URI += "file://rpi.env_serial.patch"
SRC_URI += "file://rpi.env_noserial.patch"

do_compile:append() {
    # Add the bootcmd environment variable
    echo "bootcmd=load mmc 0:1 0x10000000 splash.bmp && bmp display 0x10000000 100 100 && bootflow scan" >> ${B}/.config
}





