#!/bin/bash

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --env SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
     --tty --rm --net-host --cpus 1\
     docker.io/library/sonarqube:latest \
     test_container 
