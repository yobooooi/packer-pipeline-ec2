#!/bin/bash
echo "===System Updates==="
sudo yum update -y
sudo yum install -y git

echo "===Install Remi Repository==="
sudo amazon-linux-extras install -y epel
sudo yum install -y epel-release
sudo yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
