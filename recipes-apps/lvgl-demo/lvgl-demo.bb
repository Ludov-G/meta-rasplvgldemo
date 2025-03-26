SUMMARY = "Systemd service for LVGL Demo application"
DESCRIPTION = "Installs and enables a systemd service to run the LVGL Demo application at startup."

INSANE_SKIP_${PN} = "file-rdeps"

SRC_URI = "file://lvgl-demo.service \
           file://lvgl-demo"

LICENSE = "CLOSED"

inherit systemd

# Specify the service file
SYSTEMD_SERVICE_${PN} = "lvgl-demo.service"

do_install() {
    # Install the application
    install -d ${D}${bindir}
    install -m 0777 ${WORKDIR}/lvgl-demo ${D}${bindir}/lvgl-demo
    
    # Install the systemd service
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/lvgl-demo.service ${D}${systemd_system_unitdir}/lvgl-demo.service
    
    # Create a symlink to enable the service
    install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants
    ln -sf ${systemd_system_unitdir}/lvgl-demo.service ${D}${sysconfdir}/systemd/system/multi-user.target.wants/lvgl-demo.service
}

# Add the application files
FILES:${PN} += "${bindir}/lvgl-demo"

# Add the systemd service file
FILES:${PN} += "${systemd_system_unitdir}/lvgl-demo.service"

# Enable the service at startup
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

