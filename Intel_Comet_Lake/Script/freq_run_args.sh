#!/bin/bash

num_measure=100
start=15

file='image_arg_76_100.txt'
file2='image_name_76_100.txt'


i=1
while read -r line;
do
  run_command[i]=$line
  i=$((i+1))
done < $file

i=1
while read -r line;
do
  image_name[i]=$line
  i=$((i+1))
done < $file2


#num_container=$((${#run_command[@]}))
num_container=15
sleep 5s

for ((c=$start;c<=$num_container;c++))
do
  for ((i=1;i<=$num_measure;i++))
  do
    echo "Image: $c Measurement: $i"
    sleep 5s
    ./data.sh &
    ${run_command[c]} &
    sleep 67s
    docker ps -f 'status=running' -aq | xargs docker stop
    docker rm ${image_name[$c]}
  done
done

# 19-24
# 25-30




