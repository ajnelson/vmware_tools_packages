#!/bin/bash

set -e
set -x

#Haven't gotten this working yet.
false

sudo apt-get install build-essential linux-headers-$(uname -r)

#C/o http://askubuntu.com/questions/231876/vmware-cant-find-linux-headers-path
#Unfortunately, this is still insufficient.  There are compiler errors indicative of some header not making it in (implicit symbol definitions).
#sudo ln -s \
#  /usr/src/linux-headers-$(uname -r)/include/generated/upai/linux/version.h \
#  /usr/src/linux-headers-$(uname -r)/include/linux/version.h

#C/o http://sysadminramblings.wordpress.com/2013/05/28/vmware-tools-install-ubuntu-13-04/
#The first path came from the sysadminramblings site, didn't work; the second path tried the same approach with the askubuntu response from above, also didn't work. Shotgunning both sets of symlinks didn't work.
for path in /lib/modules/$(uname -r)/build/include/linux /usr/src/linux-headers-$(uname -r)/include/linux; do
  pushd $path
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
done
