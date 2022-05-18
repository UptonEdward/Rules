#!/bin/zsh
cd /root/Rules/Generate
wait
echo "payload:" > ChinaCIDR.txt
wait
curl -sSL http://ftp.apnic.net/stats/apnic/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' > apnic.txt
wait
curl -sSL http://ftp.apnic.net/stats/apnic/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv6/ {print $4 "/" $5}' >> apnic.txt
wait
wget https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt -O mayaxcn.txt
wait
wget https://raw.githubusercontent.com/metowolf/iplist/master/data/country/CN.txt -O metowolf.txt
wait
wget https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt -O 17mon.txt
wait
cat apnic.txt mayaxcn.txt metowolf.txt 17mon.txt > pull.txt
wait
sed -i -e 's/^/  - '\''/' pull.txt
wait
sed -i -e 's/$/'\''/' pull.txt
wait
wget https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/cncidr.txt -O loyalsoldier.txt
wait
sed -i "" '1d' loyalsoldier.txt
wait
cat loyalsoldier.txt >> pull.txt
wait
sort -u pull.txt >> /root/Rules/ChinaCIDR.txt
wait
rm -rf apnic.txt mayaxcn.txt metowolf.txt 17mon.txt pull.txt loyalsoldier.txt pull.txt-e