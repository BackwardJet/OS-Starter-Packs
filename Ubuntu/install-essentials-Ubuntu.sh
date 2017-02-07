#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y vim git
if ( lspci | grep 'VirtualBox' >/dev/null );
    then sudo apt-get install -y virtualbox-guest-dkms;
fi
