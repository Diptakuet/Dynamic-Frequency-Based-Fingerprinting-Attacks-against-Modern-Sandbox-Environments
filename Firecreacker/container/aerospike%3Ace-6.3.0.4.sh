#!/bin/bash

img_name='aerospike:ce-6.3.0.4'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     docker.io/library/$img_name \
     test_container bash

