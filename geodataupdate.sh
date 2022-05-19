#!/bin/zsh
export https_proxy=http://127.0.0.1:1089;export http_proxy=http://127.0.0.1:1089;export all_proxy=socks5://127.0.0.1:1089
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -O /storage/emulated/0/clash/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -O /storage/emulated/0/clash/geosite.dat