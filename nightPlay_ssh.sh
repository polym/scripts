cd /home/hongbomo/

echo 'killall ssh...'
killall ssh

echo '=============' >> tmppp
echo `date +"%Y-%m-%d %H:%M:%S"` >> tmppp
echo '=============' >> tmppp

cat tmppp | sed 's/$/\<br\>/g' > sshlog.html

curl -T sshlog.html http://v0.api.upyun.com/bigfile/sshlog.html -u myworker:tyghbnTYGHBN -v

echo 'start ssh ...'
ssh -v -p 8086 root@183.128.167.11 >> tmppp 2>&1

