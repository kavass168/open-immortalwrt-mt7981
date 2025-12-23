#!/bin/bash

PKG_PATH="$GITHUB_WORKSPACE/openwrt/package/"

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
#rm -rf feeds/luci/applications/luci-app-argon-config
#rm -rf feeds/luci/themes/luci-theme-argon
#git clone --depth=1 https://github.com/sbwml/luci-theme-argon.git package/luci-theme-argon
#git clone --depth=1 https://github.com/sbwml/luci-theme-argon/tree/openwrt-24.10/luci-app-argon-config package/luci-app-argon-config

# Argon 主题
cd $PKG_PATH
#cd ./openwrt/package/
git clone https://github.com/jerrykuku/luci-theme-argon.git

#修改argon主题字体和颜色
if [ -d *"luci-theme-argon"* ]; then
	echo " "

	cd ./luci-theme-argon/

	sed -i "s/primary '.*'/primary '#31a1a1'/; s/'0.2'/'0.5'/; s/'none'/'bing'/; s/'600'/'normal'/" ./luci-app-argon-config/root/etc/config/argon

	cd $PKG_PATH && echo "theme-argon has been fixed!"
fi

