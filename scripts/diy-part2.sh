#!/bin/bash


# Adguardhome
git clone --depth=1 https://github.com/sirpdboy/luci-app-adguardhome package/luci-app-adguardhome
sed -i "s/\(option enabled '\)1'/\10'/" package/luci-app-adguardhome/luci-app-adguardhome/root/etc/config/AdGuardHome

# OpenList 
#git clone --depth=1 https://github.com/sbwml/luci-app-openlist2 package/openlist


# OpenAppFilter
rm -rf feeds/luci/applications/luci-app-appfilter
rm -rf feeds/packages/net/open-app-filter
git clone --depth=1 https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter


# Argon 主题
rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
git clone --branch openwrt-24.10 --depth 1 https://github.com/sbwml/luci-theme-argon package/luci-theme-argon
git clone --branch openwrt-24.10 --depth 1 https://github.com/sbwml/luci-app-argon-config package/luci-app-argon-config





