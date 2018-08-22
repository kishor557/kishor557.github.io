#! /bin/bash

## sudo chmod 755 <filename>.sh
## ./filename.sh >> data.txt

clear

#colors
RED='\033[0;31m'
GREEN='\033[0;32m'


# Define Variable tecreset
var=$(tput sgr0)

now=$(date)
echo -e "\n\n#### Stats at $now #####\n\n"


# Check Logged In Users
users=$(who)
echo -e "${RED}Logged In users : \n ${GREEN}$users" $var 

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e "\n${RED}Disk Usages : ${GREEN}" 
cat /tmp/diskusage
echo "$var"


# Check RAM and SWAP Usages
usage=$(free -h)
echo -e "\n${RED}RAM & SWAP Usages : \n${GREEN} $usage" $var 


# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e "\n${RED}Load Average :${GREEN} $loadaverage" $var 

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e "\n${RED}System Uptime Days/(HH:MM) :${GREEN} $tecuptime" $var 

echo -e "\n ######## \n"

# Remove Temporary Files
rm /tmp/diskusage
