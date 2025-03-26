FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://disable_tt1.conf"
SRC_URI += "file://disable_ttS0.conf"

do_install:append() {
    # Create the override directory for getty@tty1.service.d
    install -d ${D}${systemd_system_unitdir}/getty@tty1.service.d
    install -m 0644 ${WORKDIR}/disable_tt1.conf ${D}${systemd_system_unitdir}/getty@tty1.service.d/

    # Create the override directory for serial-getty@ttyS0.service.d
    install -d ${D}${systemd_system_unitdir}/serial-getty@ttyS0.service.d
    install -m 0644 ${WORKDIR}/disable_ttS0.conf ${D}${systemd_system_unitdir}/serial-getty@ttyS0.service.d/
}

