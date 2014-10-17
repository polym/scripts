#!/bin/bash
cd /home/hongbomo/work/nami/
. /etc/environment
. /etc/profile
. /home/hongbomo/.profile
echo $PATH
env
time=`date +'%H:%M'`
py.test 2>&1 > "$time".log
