#!/bin/bash
if [ "$1" == "-h" ];then
  echo "Usage: docker_clean COMMAND" 
  echo ""
  echo "Commands:"
  echo "    stop        stop all docker containers"
  echo "    rm          rm all docker containers"    
  echo "    image name  rm all docker images which has substring like name"
  echo ""
  exit 0
fi

echo $1
if [ "$1" == "stop" ] || [ "$1" == "" ];then
  for cid in `sudo docker ps | awk '{print $1}'`
  do
    if [ "$cid" == "CONTAINER" ];then
      continue 
    fi
    sudo docker stop $cid
  done
fi

if [ "$1" == "rm" ] || [ "$1" == "" ];then
  for cid in `sudo docker ps -a | awk '{print $1}'`
  do
    if [ "$cid" == "CONTAINER" ];then
      continue 
    fi
    sudo docker rm $cid
  done
fi

if [ "$1" == "image" ];then
  for cid in `sudo docker images | grep $2 | awk '{print $3}'`
  do
    if [ "$cid" == "CONTAINER" ];then
      continue 
    fi
    sudo docker rmi $cid
  done
fi
