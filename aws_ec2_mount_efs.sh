#!/bin/bash
# Amazon EFS mount on EC2 instructions (tested on 16.04)
# Update the apt package index
sudo apt-get update
# Install the nfs client on your EC2 instance:
echo "Installing nfs client..."
sudo apt-get -y install nfs-common
# Create a new directory on your EC2 instance, such as "efs":
sudo mkdir efs
# Mount your file system using the DNS name:
echo "Mounting efs to ec2..."
sudo mount -t nfs4 -o \
  nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 \
  fs-806096f9.efs.us-east-2.amazonaws.com:/ efs
