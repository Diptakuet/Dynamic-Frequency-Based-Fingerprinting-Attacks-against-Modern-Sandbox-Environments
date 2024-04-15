#!/bin/bash

num_measure=1
start=21

num_container=50


file='image_name.txt'


i=1
while read -r line;
do
  image_name[i]=$line
  i=$((i+1))
done < $file


#num_container=$((${#run_command[@]}))

for ((c=$start;c<=$num_container;c++))
do
  for ((i=1;i<=$num_measure;i++))
  do
    echo "Image: $c Measurement: $i  ${image_name[c]}"
    sleep 3s
    docker pull ${image_name[c]} 
  done
done
# 10
