#!/bin/bash

#img_name='nextcloud:latest'

file='container_part1.txt'

while read -r line;
do
  img[i]=$line
  i=$((i+1))
done < $file

num_container=$((${#img[@]}))

for ((i=1;i<=$num_container;i++))
do
  echo "Container: $i ${img[i]}"
  #sleep 5s
  sudo firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     image rm docker.io/library/${img[i]}
done




