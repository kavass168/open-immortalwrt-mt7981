#!/bin/bash

# 3. 覆盖适配文件到官方源码
cp $GITHUB_WORKSPACE/hy3000/filogic.mk $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/image/
cp $GITHUB_WORKSPACE/hy3000/mt7981b-philips-hy3000.dts $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/dts/
cp $GITHUB_WORKSPACE/hy3000/02_network $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/filogic/base-files/etc/board.d/
cp $GITHUB_WORKSPACE/hy3000/platform.sh $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/filogic/base-files/lib/upgrade/        
cp $GITHUB_WORKSPACE/hy3000/11-mt76-caldata $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/filogic/base-files/etc/hotplug.d/firmware/ 
cp $GITHUB_WORKSPACE/hy3000/11_fix_wifi_mac $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/filogic/base-files/etc/hotplug.d/ieee80211/
cp $GITHUB_WORKSPACE/hy3000/mediatek_filogic $GITHUB_WORKSPACE/openwrt/package/boot/uboot-tools/uboot-envtools/files/
cp $GITHUB_WORKSPACE/hy3000/hy3000.conf $GITHUB_WORKSPACE/openwrt/.config

mv -f $GITHUB_WORKSPACE/hy3000/boot-uboot-makefile $GITHUB_WORKSPACE/openwrt/package/boot/uboot-mediatek/Makefile
mkdir -p $GITHUB_WORKSPACE/openwrt/package/boot/uboot-mediatek/src/configs
cp $GITHUB_WORKSPACE/hy3000/mt7981_philips_hy3000_defconfig $GITHUB_WORKSPACE/openwrt/package/boot/uboot-mediatek/src/configs/
 
mkdir -p $GITHUB_WORKSPACE/openwrt/package/boot/uboot-mediatek/src/arch/arm/dts
cp $GITHUB_WORKSPACE/hy3000/mt7981-philips-hy3000.dts $GITHUB_WORKSPACE/openwrt/package/boot/uboot-mediatek/src/arch/arm/dts/
 
mkdir -p $GITHUB_WORKSPACE/openwrt/package/boot/uboot-mediatek/src/defenvs

