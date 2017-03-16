#!/bin/bash
sudo yum update
sudo yum install -y vim git epel-release
if ( lspci | grep 'VirtualBox' >/dev/null );
    then sudo yum install -y dkms openssh-server;
fi
