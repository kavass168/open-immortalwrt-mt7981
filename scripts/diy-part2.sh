#!/bin/bash


# UPDATE_PACKAGE "包名" "项目地址" "项目分支" "pkg/name，可选，pkg为从大杂烩中单独提取包名插件；name为重命名为包名"
UPDATE_PACKAGE "argon" "sbwml/luci-theme-argon" "openwrt-24.10"
#UPDATE_PACKAGE "aurora" "eamonxg/luci-theme-aurora" "master"
#UPDATE_PACKAGE "aurora-config" "eamonxg/luci-app-aurora-config" "master"
#UPDATE_PACKAGE "nikki" "nikkinikki-org/OpenWrt-nikki" "main"



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
git clone --depth=1 https://github.com/sbwml/luci-theme-argon package/luci-theme-argon









