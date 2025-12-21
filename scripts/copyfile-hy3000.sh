#!/bin/bash

# 3. 覆盖适配文件到官方源码
cp $GITHUB_WORKSPACE/hy3000/filogic.mk ./openwrt/target/linux/mediatek/image/
cp $GITHUB_WORKSPACE/hy3000/mt7981b-philips-hy3000.dts ./openwrt/target/linux/mediatek/dts/
cp $GITHUB_WORKSPACE/hy3000/02_network ./openwrt/target/linux/mediatek/filogic/base-files/etc/board.d/
cp $GITHUB_WORKSPACE/hy3000/platform.sh ./openwrt/target/linux/mediatek/filogic/base-files/lib/upgrade/        
cp $GITHUB_WORKSPACE/hy3000/11-mt76-caldata ./openwrt/target/linux/mediatek/filogic/base-files/etc/hotplug.d/firmware/ 
cp $GITHUB_WORKSPACE/hy3000/11_fix_wifi_mac ./openwrt/target/linux/mediatek/filogic/base-files/etc/hotplug.d/ieee80211/11_fix_wifi_mac/
cp $GITHUB_WORKSPACE/hy3000/hy3000.conf ./openwrt/.config
