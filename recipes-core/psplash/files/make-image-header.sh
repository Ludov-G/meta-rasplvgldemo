#!/bin/sh
#
# SPDX-License-Identifier: GPL-2.0-or-later
# to execute:   sudo ./make-image-header.sh psplash.png POKY

set -e

imageh=my-psplash-raspberrypi-img.h
name="${2}_IMG"
gdk-pixbuf-csource --macros $1 > $imageh.tmp
sed -e "s/MY_PIXBUF/${name}/g" -e "s/guint8/uint8/g" $imageh.tmp > $imageh && rm $imageh.tmp
