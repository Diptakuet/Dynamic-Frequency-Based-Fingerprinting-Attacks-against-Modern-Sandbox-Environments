#!/bin/bash

echo "Image: "
read image

sudo ./gsc sign-image $image enclave-key.pem
sudo ./gsc info-image gsc-$image
