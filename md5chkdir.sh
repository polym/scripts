ROOT=`pwd`
echo $ROOT
for file in `find $ROOT -type f | grep -v image_server`
do
  prefix=${file%%.*}
  suffix=${file##*.}
  file_2=$prefix"_image_server."$suffix
  md5_1=`md5sum $file | awk '{print $1}'` 
  md5_2=`md5sum $file_2 | awk '{print $1}'` 
  if [ "$md5_1" != "$md5_2" ];then
    echo $file
  fi

done
