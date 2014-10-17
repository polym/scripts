#!/bin/bash
echo "configure..." 
echo -n "image name: " && read img
echo -n "container name: " &&  read ctn
echo -n "ssh port: " &&  read port
echo -n "directory share: " && read dir

d_dir=${dir##*/}

cmd="sudo docker run -d"

if [ "$ctn" != "" ];
then
    cmd="$cmd --name $ctn"
fi    

if [ "$port" != "" ];
then
    cmd="$cmd -p $port:22"
fi    

if [ "$dir" != "" ];
then
    cmd="$cmd -v $dir:/root/$d_dir"
else
    cmd="$cmd -v ~/work/:/root/work"
fi

if [ "$img" != "" ];
then
    cmd="$cmd $img"
fi    

echo $cmd
eval $cmd

echo "ssh -p $port root@localhost"
