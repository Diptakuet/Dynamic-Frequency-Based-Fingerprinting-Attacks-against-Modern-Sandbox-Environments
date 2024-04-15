#!/bin/bash

num_measure=100

file='container_name.txt'


i=1
while read -r line;
do
  run_container[i]=$line
    i=$((i+1))
    done < $file

num_container=$((${#run_container[@]}))



for ((i=1;i<=$num_container;i++))
do
  for ((j=1;j<=$num_measure;j++))
  do
    echo "Container: $i Measurement: $j ${run_container[i]}"
    sleep 5s
    ./data.sh >> Data/${run_container[i]}.txt &
    taskset -c 1 sudo ./container/${run_container[i]}.sh &
    sleep 45s 
    ./kill_container.sh
    sleep 2s
  done
done
