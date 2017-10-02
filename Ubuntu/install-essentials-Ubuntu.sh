#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y vim git
if ( lspci | grep 'VirtualBox' >/dev/null );
    then sudo apt-get install -y virtualbox-guest-dkms openssh-server;
fi
