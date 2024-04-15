#!/bin/bash

num_measure=100

file='container_name.txt'


i=1
while read -r line;
do
  run_container[i]=$line
  i=$((i+1))
done < $file


file2='file_name.txt'


i=1
while read -r line;
do
  name_container[i]=$line
  i=$((i+1))
done < $file2




num_container=$((${#run_container[@]}))



for ((i=95;i<=108;i++)) #$num_container;i++))
do
  for ((j=1;j<=$num_measure;j++))
  do
    echo "Container: $i Measurement: $j ${run_container[i]}"
    sleep 5s
    ./data.sh >> amd_data/${name_container[i]}.txt &
    taskset -c 1 sudo nerdctl run --rm -t --cpuset-cpus='1' --runtime io.containerd.run.kata.v2 --name test_container ${run_container[i]} &
    sleep 45s 
    #sudo nerdctl ps
    #sleep 2s
    ./kill_container.sh
    sleep 2s
  done
done
