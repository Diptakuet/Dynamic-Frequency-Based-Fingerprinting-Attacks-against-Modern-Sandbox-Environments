#!/bin/bash

read image

sudo docker run --rm --cpuset-cpus=1 -t --device=/dev/sgx_enclave \
   -v /var/run/aesmd/aesm.socket:/var/run/aesmd/aesm.socket \
   --name test-image gsc-$image


