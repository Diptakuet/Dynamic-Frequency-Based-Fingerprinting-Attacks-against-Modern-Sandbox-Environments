#!/bin/bash

num_measure=1
start=28

num_container=28


file='image_name_1_30.txt'


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
    sleep 5s
    docker run -d -it --cpuset-cpus=1 --device=/dev/sgx_enclave \
               -v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket \
               --name test_image --rm gsc-${image_name[c]} &
    sleep 20s
    docker ps
    #docker ps -f 'status=running' -aq | xargs docker stop
    #docker rm ${image_name[$c]}
    ./kill_docker.sh
    sleep 2s
    docker ps
  done
done
# 10
