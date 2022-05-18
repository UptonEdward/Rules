#!/bin/zsh
cd /Users/charlesgray/Documents/GitHub/Rules/Generate
echo "payload:" > ChinaCIDR.txt
curl -sSL http://ftp.apnic.net/stats/apnic/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' > apnic.txt
curl -sSL http://ftp.apnic.net/stats/apnic/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv6/ {print $4 "/" $5}' >> apnic.txt
wget https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt -O mayaxcn.txt
wget https://raw.githubusercontent.com/metowolf/iplist/master/data/country/CN.txt -O metowolf.txt
wget https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt -O 17mon.txt
awk 1 apnic.txt mayaxcn.txt metowolf.txt 17mon.txt > pull.txt
sed -i -e 's/^/  - '\''/' pull.txt
sed -i -e 's/$/'\''/' pull.txt
wget https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/cncidr.txt -O loyalsoldier.txt
sed -i "" '1d' loyalsoldier.txt
awk 1 loyalsoldier.txt >> pull.txt
sort -u pull.txt >> ChinaCIDR.txt
mv ChinaCIDR.txt /Users/charlesgray/Documents/GitHub/Rules/ChinaCIDR.txt
sleep 5
rm -rf apnic.txt mayaxcn.txt metowolf.txt 17mon.txt pull.txt loyalsoldier.txt pull.txt-e