#!/bin/bash
cd /home/hongbomo/work/usopp/
. /etc/environment
. /etc/profile
. /home/hongbomo/.profile
echo $PATH
env
time=`date +'%H:%M'`
./ci.sh 2>&1 > "$time".log

