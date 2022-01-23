#!/bin/bash
cd script/hosts/src

# Start Download
#curl -o i1.txt https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardDNS.txt 
#curl -o i2.txt https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardMobileSpyware.txt
#curl -o i3.txt https://adaway.org/hosts.txt
#curl -o i4.txt https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardApps.txt
#curl -o i5.txt https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardMobileAds.txt
#curl -o i6.txt https://raw.githubusercontent.com/badmojr/1Hosts/master/mini/hosts.txt
curl -o i7.txt https://raw.githubusercontent.com/VeleSila/yhosts/master/hosts.txt
#curl -o i8.txt https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
curl -o i9.txt https://raw.githubusercontent.com/ilpl/ad-hosts/master/hosts
#curl -o i10.txt https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts
curl -o i11.txt https://raw.githubusercontent.com/cumberjie/Ad-set-hosts/master/hosts

# Start Merge and Duplicate Removal
cat i*.txt > mergd.txt
cat mergd.txt | grep '^1'  > 1.txt
cat mergd.txt | grep '^0'  > 0.txt
cat 1.txt 0.txt user.dd > tmpp.txt
sort tmpp.txt | uniq > tmp.txt
sed -i '1d' tmp.txt

# hosts
curl -s https://cats-team.coding.net/p/adguard/d/AdRules/git/raw/main/rules/fasthosts.txt > gh.txt
sed -i "s/#.*//g" gh.txt
sed -i "/^$/d" gh.txt

# Start Count Rules
num=`cat tmp.txt gh.txt | wc -l`

# Start Add title and date
echo "! Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "! Total count: $num" >> tpdate.txt
 
cat tpdate.txt tmp.txt gh.txt> final.txt

mv final.txt ../../hosts.txt
rm *.txt
cd ../../
exit
