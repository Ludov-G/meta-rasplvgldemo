#!/bin/bash

# Define the directory where the image files are located
IMAGES_DIR="/home/user/yocto/poky/build/tmp/deploy/images/raspberrypi4-64"  # Modify with the correct path

# Find the latest .rpi-sdimg file generated (sorted by modification date)
IMAGE_FILE=$(ls -t ${IMAGES_DIR}/*core-image-base-raspberrypi4-64*.rpi-sdimg | head -n 1)

# Check if a file was found
if [ -z "$IMAGE_FILE" ]; then
  echo "Error: no .rpi-sdimg file found!"
  exit 1
fi

echo "Image file found: $IMAGE_FILE"

# Define the destination (the SD card device)
SD_CARD="/dev/sdb"  # Modify with the correct path for your SD card

# Check if the SD card is available
if [ ! -b "$SD_CARD" ]; then
  echo "Error: SD device $SD_CARD not found!"
  exit 1
fi

# Run the dd command to write the image to the SD card
echo "Writing the image to the SD card ($SD_CARD)..."
sudo dd if="$IMAGE_FILE" of="$SD_CARD" bs=4M status=progress oflag=sync

# When finished, run sync to ensure data is written
sync

echo "Writing completed!"

