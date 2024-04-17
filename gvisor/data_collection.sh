#!/bin/bash

num_img=126
num_measure=100



file='container_name.txt'

i=1
while read -r line;
do
  img_name[i]=$line
  i=$((i+1))
done < $file

file2='special_docker_arg.txt'

i=1
while read -r line;
do
  img_arg[i]=$line
  i=$((i+1))
done < $file2


for ((i=1;i<=$num_img;i++))
do
  for ((j=1;j<=$num_measure;j++))
  do
    echo "Image: $i Measurement: $j Name: ${img_name[i]}"
    sleep 5s
    if [[ $i -lt 105 ]]
    then
        ./data.sh >> Data/${img_name[i]}.txt &
        docker run --cpuset-cpus=1 -it --rm --runtime=runsc --name ${img_name[i]} ${img_name[i]}:latest &
        sleep 60s
        docker ps
        docker ps -f 'status=running' -aq | xargs docker inspect --format '{{.State.Pid}}' | xargs sudo kill -KILL 
        sleep 2s
    else
        ./data.sh >> Data/${img_name[i]}.txt &
        ${img_arg[$((i-105+1))]} &
        sleep 60s
        docker ps
        docker ps -f 'status=running' -aq | xargs docker inspect --format '{{.State.Pid}}' | xargs sudo kill -KILL 
        sleep 2s
    fi
  done
done
