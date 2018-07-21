#!/bin/bash
user="user" ip_old="`tail /home/$user/.infoip`" 
ip_now="`wget -qO- http://checkip.dyndns.org/ | sed "s/.* \([[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\).*/\1/g"`"
echo $ip_now > /home/$user/.infoip
if [ "$ip_old" != "$ip_now" ];
then
titoloip="Public IP changed!"
ipresult="The new IP is $ip_now"
echo $titoloip $ipresult | mail -s "IP Public" <user@domain>
fi
exit

