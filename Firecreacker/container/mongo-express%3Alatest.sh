#!/bin/bash

img_name='mongo-express:latest'

sudo taskset -c 1 firecracker-ctr --address /run/firecracker-containerd/containerd.sock \
     run \
     --snapshotter devmapper \
     --runtime aws.firecracker \
     --tty --rm --net-host --cpus 1 \
     --env ME_CONFIG_OPTIONS_EDITORTHEME="ambiance" \
     --env ME_CONFIG_MONGODB_SERVER="web_db_1" \
     --env ME_CONFIG_BASICAUTH_USERNAME="user" \
     --env ME_CONFIG_BASICAUTH_PASSWORD="fairly long password" \
     docker.io/library/$img_name \
     test_container 
