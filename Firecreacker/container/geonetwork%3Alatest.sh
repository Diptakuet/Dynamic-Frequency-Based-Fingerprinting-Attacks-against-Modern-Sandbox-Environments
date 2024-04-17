#!/bin/bash

img_name='geonetwork:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env ES_HOST=elasticsearch \
     docker.io/library/$img_name \
     test_container bash

