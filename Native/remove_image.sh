#!/bin/bash

num_measure=1

file='container_name.txt'


i=1
while read -r line;
do
  img_name[i]=$line
  i=$((i+1))
done < $file

num_container=100 #$((${#run_container[@]}))



for ((i=61;i<=$num_container;i++))
do
  for ((j=1;j<=$num_measure;j++))
  do
    echo "Container: $i ${img_name[i]} Measure: $j"
    sleep 3s
    docker image rm ${img_name[i]}
  done
done
