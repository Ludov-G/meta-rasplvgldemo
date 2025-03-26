do_deploy:append() {
    CONFIG=${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt

    # Svuota il file esistente
    echo "" > $CONFIG

    # Aggiungi le impostazioni personalizzate
    echo "max_usb_current=1" >> $CONFIG
    echo "hdmi_force_hotplug=1" >> $CONFIG
    echo "hdmi_group=2" >> $CONFIG
    echo "hdmi_mode=87" >> $CONFIG
    echo "hdmi_cvt 1024 600 60 6 0 0 0" >> $CONFIG
    echo "hdmi_drive=1" >> $CONFIG
    echo "otg_mode=1" >> $CONFIG
    echo "boot_delay=0" >> $CONFIG
    echo "disable_splash=1" >> $CONFIG
    echo "dtoverlay=disable-bt" >> $CONFIG
    echo "enable_uart=0" >> $CONFIG
}

