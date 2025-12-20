# SPDX-License-Identifier: GPL-2.0-or-later OR MIT
#
# Full filogic.mk for SL3000 eMMC (MT7981)

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

# ===========================
# 平台构建规则（必须保留）
# ===========================

define Build/append-dtb
	cat $(DTS_DIR)/$(DEVICE_DTS).dtb >> $(KERNEL_BUILD_DIR)/Image
endef

define Build/append-rootfs
	cat $(IMAGE_ROOTFS) >> $(KERNEL_BUILD_DIR)/Image
endef

define Build/pad-to
	dd if=/dev/zero bs=$(1) count=1 >> $(KERNEL_BUILD_DIR)/Image
endef

define Build/sysupgrade-tar
	$(TAR) -cf $@ \
		--transform 's,^,sysupgrade/,' \
		$(KERNEL_BUILD_DIR)/Image \
		$(IMAGE_ROOTFS)
endef

# ===========================
# 默认模板（必须保留）
# ===========================

define Device/Default
  PROFILES := Default
  KERNEL_NAME := Image
  KERNEL := kernel-bin
  KERNEL_INITRAMFS := kernel-bin
  IMAGES := sysupgrade.bin initramfs.bin
endef

# ===========================
# SL3000 eMMC（你的设备）
# ===========================

define Device/sl3000-emmc
  $(call Device/Default)

  DEVICE_VENDOR := SL
  DEVICE_MODEL := SL3000
  DEVICE_VARIANT := eMMC

  DEVICE_DTS := mediatek/mt7981-sl3000-emmc
  SUPPORTED_DEVICES := sl3000-emmc

  IMAGE/sysupgrade.bin := append-rootfs | pad-to 128k | sysupgrade-tar
  IMAGE/initramfs.bin := append-dtb | append-rootfs | pad-to 128k | gzip

  DEVICE_PACKAGES := \
    kmod-mt7915e \
    kmod-mt7981-firmware \
    kmod-mt7531 \
    kmod-mmc \
    kmod-mmc-mtk \
    kmod-gpio-button-hotplug \
    kmod-leds-gpio \
    block-mount \
    e2fsprogs \
    fdisk \
    luci \
    luci-theme-argon \
    luci-app-statistics \
    luci-app-sqm \
    luci-app-turboacc \
    luci-app-flowoffload \
    luci-app-socat
endef

TARGET_DEVICES += sl3000-emmc
