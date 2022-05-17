#!/bin/zsh
cd /Users/charlesgray/Desktop/服务器/Rules/gen
echo "payload:" > ChinaCIDR.txt
curl -sSL http://ftp.apnic.net/stats/apnic/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv4/ {print $4 "/" 32-log($5)/log(2)}' > cidr4.txt
sed -i -e 's/^/  - '\''/' cidr4.txt
sed -i -e 's/$/'\''/' cidr4.txt
curl -sSL http://ftp.apnic.net/stats/apnic/delegated-apnic-latest | awk -F '|' '/CN/&&/ipv6/ {print $4 "/" $5}' > cidr6.txt
sed -i -e 's/^/  - '\''/' cidr6.txt
sed -i -e 's/$/'\''/' cidr6.txt
cat cidr4.txt >> ChinaCIDR.txt
cat cidr6.txt >> ChinaCIDR.txt
mv ChinaCIDR.txt /Users/charlesgray/Desktop/服务器/Rules/ChinaCIDR.txt
cd /Users/charlesgray/Desktop/服务器/Rules
git add .
git pull
git commit  -m "Generate ChinaCIDR"
git push -u origin master