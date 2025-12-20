#!/bin/bash

echo "=== SL3000 环境自检开始 ==="

# 1. 检查 filogic.mk 是否存在
if [ ! -f "openwrt/target/linux/mediatek/image/filogic.mk" ]; then
    echo "❌ 缺少 filogic.mk"
    exit 1
else
    echo "✅ filogic.mk 存在"
fi

# 2. 检查 filogic.mk 是否包含设备定义
grep -q "Device/sl3000-emmc" openwrt/target/linux/mediatek/image/filogic.mk
if [ $? -ne 0 ]; then
    echo "❌ filogic.mk 中没有 Device/sl3000-emmc 定义"
    exit 1
else
    echo "✅ filogic.mk 中包含 Device/sl3000-emmc"
fi

# 3. 检查 DTS 路径
if [ ! -f "openwrt/target/linux/mediatek/files-5.15/arch/arm64/boot/dts/mediatek/mt7981-sl3000-emmc.dts" ]; then
    echo "❌ DTS 文件不存在"
    exit 1
else
    echo "✅ DTS 文件存在"
fi

# 4. 检查 defconfig 后是否启用 SL3000
grep -q "CONFIG_TARGET_mediatek_filogic_DEVICE_sl3000-emmc=y" openwrt/.config
if [ $? -ne 0 ]; then
    echo "❌ .config 中未启用 SL3000"
    exit 1
else
    echo "✅ .config 已启用 SL3000"
fi

echo "=== ✅ SL3000 环境自检通过，可以安全构建 ==="
exit 0
