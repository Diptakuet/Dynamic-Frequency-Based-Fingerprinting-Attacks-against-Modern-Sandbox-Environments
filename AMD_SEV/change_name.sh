#!/bin/bash

file='file_name.txt'
i=1
while read -r line;
do
  img_new[i]=$line
  i=$((i+1))
done < $file

file2='working_container.txt'
i=1
while read -r line;
do
  img_old[i]=$line
  i=$((i+1))
done < $file2


num_container=20 #$((${#img[@]}))

for ((i=1; i<=$num_container; i++))
do
  cp amd_data/${img_old[i]}.txt amd_data/Rename/${img_new[i]}.txt
done










