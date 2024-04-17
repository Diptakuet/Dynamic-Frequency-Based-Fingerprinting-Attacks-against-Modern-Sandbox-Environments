#!/bin/bash

img_name='elasticsearch:8.7.1'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env "discovery.type=single-node" \
     docker.io/library/$img_name \
     test_container bash
