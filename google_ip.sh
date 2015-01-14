curl -v "http://www.ipip.net/ping.php?a=send&host=google.com&area=other" -m 60 > /tmp/google_ip.raw
cat /tmp/google_ip.raw | egrep -o 'ip":"([0-9]{1,3}\.){3}[0-9]{1,3}' | awk -F '"' '{print $3}'| sort -u > /tmp/google_ip
> /tmp/good
for ip in `cat /tmp/google_ip`:
do
   curl --connect-timeout 5 $ip 2>&1 > /dev/null
   if [ $? -ne 28 ]
   then
       echo $ip >> /tmp/good
   fi
done
