#!/bin/bash

img_name='known:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env KNOWN_DB_PASSWORD="password" \
     docker.io/library/$img_name \
     test_container
