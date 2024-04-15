#!/bin/bash

num_measure=1

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




num_container=115 #$((${#run_container[@]}))



for ((i=105;i<=$num_container;i++))
do
  for ((j=1;j<=$num_measure;j++))
  do
    echo "Container: $i ${img_name[i]} Measure: $j"
    sleep 3s
    echo ${img_name[i]}
    if [[ ${img_name[i]} == "elasticsearch" ]]; then
       docker pull ${img_name[i]}:8.10.3
    elif [[ ${img_name[i]} == "vault" ]]; then
       docker pull ${img_name[i]}:1.13.3
    elif [[ ${img_name[i]} == "logstash" ]]; then
       docker pull ${img_name[i]}:8.10.2
    else
       docker pull ${img_name[i]}
    fi
  done
done
