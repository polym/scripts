#!/bin/sh
case "$1" in

  "deps")
    cd tests
    if [ ! -f input.tar.gz ]; then
        wget http://bigfile.b0.upaiyun.com/input.tar.gz
    fi
    if [ -d input ]; then    
        rm -r input
    fi
    tar -zxvf input.tar.gz
    cd ..
  ;;

  "start")
    ./nami -m 200000000 -d -l zlog.conf -w 2 -t 60 -b 0.0.0.0:8082

  "test")
    py.test --cov ./tests 
  ;;

  "clean")
    killall nami
  ;;
  
