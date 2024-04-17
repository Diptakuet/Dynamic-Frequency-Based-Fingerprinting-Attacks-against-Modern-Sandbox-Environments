#!/bin/bash

num_measure=100

file='image_name_1_50.txt'


i=1
while read -r line;
do
  image_name[i]=$line
  i=$((i+1))
done < $file


num_container=$((${#image_name[@]}))

sleep 5s

for ((c=1;c<=$num_container;c++))
do
  for ((i=1;i<=$num_measure;i++))
  do
    echo "Image: $c Measurement: $i"
    sleep 5s
    ./data.sh >> Data/${image_name[c]}.txt &
    docker run -t --cpuset-cpus=1 --device=/dev/sgx_enclave \
               -v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket \
               --name test_image --rm gsc-${image_name[c]} &
    sleep 57s
    docker ps
    ./kill_docker.sh 
    sleep 2s
  done
done
# 10
