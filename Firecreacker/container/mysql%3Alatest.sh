#!/bin/bash

img_name='mysql:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env MYSQL_ROOT_PASSWORD=my-secret-pw \
     docker.io/library/$img_name \
     test_container bash

