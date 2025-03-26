do_deploy:append() {
    CMDLINE_FILE="${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/cmdline.txt"

    # Svuota il file e scrive il nuovo contenuto
    echo "dwc_otg.lpm_enable=0 console=null root=/dev/mmcblk0p2 rootfstype=ext4 rootwait logo.nologo net.ifnames=0 quiet splash vt.global_cursor_default=0" > $CMDLINE_FILE
}
