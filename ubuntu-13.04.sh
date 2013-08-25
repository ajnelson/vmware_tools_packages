#!/bin/bash

set -e
set -x

# This worked out of the box.
sudo apt-get install build-essential kernel-headers-$(uname -r)

#C/o http://askubuntu.com/questions/231876/vmware-cant-find-linux-headers-path
#Unfortunately, this is still insufficient.  There are compiler errors indicative of some header not making it in (implicit symbol definitions).
#sudo ln -s \
#  /usr/src/linux-headers-$(uname -r)/include/generated/upai/linux/version.h \
#  /usr/src/linux-headers-$(uname -r)/include/linux/version.h

#C/o http://sysadminramblings.wordpress.com/2013/05/28/vmware-tools-install-ubuntu-13-04/
pushd /lib/modules/$(uname -r)/build/include/linux
if [ ! -r utsrelease.h ]; then
  sudo ln -s ../generated/utsrelease.h
fi
if [ ! -r autoconf.h ]; then
  sudo ln -s ../generated/autoconf.h
fi
if [ ! -r version.h ]; then
  sudo ln -s ../generated/uapi/linux/version.h
fi
popd
