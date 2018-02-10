#!/bin/bash

pwd=`pwd`
cmd='makepkg -sf --noconfirm'

if [ "`sudo cat /etc/sudoers | grep pacman`" == "" ] ; then
   echo "please add '`whoami` ALL=NOPASSWD: /usr/bin/pacman' to your /etc/sudoers file"
   exit 1
fi

echo '  -> cleaning environment ...'
rm -R ${pwd}/*/{src,pkg} -f

echo '  -> building extramodules ...'
cd ${pwd}/*acpi_call && $cmd
cd ${pwd}/*bbswitch && $cmd
cd ${pwd}/*broadcom-wl && $cmd
cd ${pwd}/*catalyst && makepkg -df --noconfirm
cd ${pwd}/*ndiswrapper && $cmd
cd ${pwd}/*nvidia && $cmd
cd ${pwd}/*nvidia-304xx && makepkg -d --noconfirm
cd ${pwd}/*nvidia-340xx && makepkg -d --noconfirm
cd ${pwd}/*nvidiabl && $cmd
cd ${pwd}/*r8168 && $cmd
cd ${pwd}/*rt3562sta && $cmd
cd ${pwd}/*tp_smapi && $cmd
cd ${pwd}/*vhba-module && $cmd
cd ${pwd}/*virtualbox-modules && $cmd

echo '  -> cleaning up ...'
rm -R ${pwd}/*/{src,pkg} -f
sudo pacman -R nvidia-304xx-utils --noconfirm
echo 'done.'
