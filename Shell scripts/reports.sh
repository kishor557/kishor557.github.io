#! /bin/bash

## sudo chmod 755 <filename>.sh
## ./filename.sh >> data.txt

clear


# Define Variable tecreset

now=$(date)
echo -e "\n\n\n\n\n#### Stats at $now #####\n\n"


# Check Logged In Users
users=$(who)
echo -e "Logged In users : \n $users"  

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e "\nDisk Usages : " 
cat /tmp/diskusage


# Check RAM and SWAP Usages
usage=$(free -h)
echo -e "\nRAM & SWAP Usages : \n $usage"  


# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e "\nLoad Average : $loadaverage"  

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e "\nSystem Uptime Days/(HH:MM) : $tecuptime"  

echo -e "\n ######## \n"


# Remove Temporary Files
rm /tmp/diskusage
