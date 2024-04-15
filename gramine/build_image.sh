#!/bin/bash

echo "Image: "
read image

sudo ./gsc build --insecure-args $image test/generic.manifest

#sudo ./gsc sign-image $image enclave-key.pem
#sudo ./gsc info-image gsc-$image
