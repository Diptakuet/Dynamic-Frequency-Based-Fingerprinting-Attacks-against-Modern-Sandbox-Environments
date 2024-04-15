#!/bin/bash

#s=$(date +%s)
sample=4000


for ((j=1;j<=$sample;j++))
do
  echo $j $(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
  sleep 0.01s
done

#e=$(date +%s)

#dur=$(($e-$s))
#echo "Dur: $dur"




