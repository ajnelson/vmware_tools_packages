#!/bin/bash

# H/t to: http://communities.vmware.com/message/2179367#2179367
# H/t to: http://communities.vmware.com/message/2188131#2188131

set -e
set -x

#Haven't gotten this working yet.
false

sudo yum -y install \
  binutils \
  gcc \
  kernel-* \
  make

sudo cp /usr/src/kernels/$(uname -r)/include/generated/uapi/linux/version.h /lib/modules/$(uname -r)/build/include/linux/
