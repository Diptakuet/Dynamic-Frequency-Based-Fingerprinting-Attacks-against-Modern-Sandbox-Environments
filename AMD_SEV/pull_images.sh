#!/bin/bash


file='container_name.txt'

i=1
while read -r line;
do
  img[i]=$line
  i=$((i+1))
done < $file

num_container=$((${#img[@]}))




for ((i=1;i<=$num_container;i++))
do
  echo "Container: $i ${img[i]}"
  sleep 5s
  sudo nerdctl pull docker.io/library/${img[i]}
  echo "Pulling Done!!"
done
