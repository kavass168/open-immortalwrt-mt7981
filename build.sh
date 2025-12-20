#!/bin/bash
set -e

# 拉取官方源码
if [ ! -d build_dir/openwrt ]; then
    git clone https://github.com/immortalwrt/immortalwrt build_dir/openwrt
fi

# 应用三件套
bash scripts/apply.sh

# 开始构建
cd build_dir/openwrt
make defconfig
make -j$(nproc) V=s
