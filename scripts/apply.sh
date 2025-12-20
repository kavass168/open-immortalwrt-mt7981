#!/bin/bash
set -e

OWRT=build_dir/openwrt

echo "[SL3000] Applying overlay..."

# DTS
cp dts/mt7981-sl3000-emmc.dts \
   $OWRT/target/linux/mediatek/dts/

# MK
cp image/filogic.mk \
   $OWRT/target/linux/mediatek/image/

# CONFIG
cp config/sl3000.config \
   $OWRT/.config

echo "[SL3000] Overlay applied."
