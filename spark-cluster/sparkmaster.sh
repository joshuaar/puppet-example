#!/bin/bash
sudo yum -y install puppet
echo "192.168.33.10 puppetmaster" > /etc/hosts
echo "192.168.33.11 sparkmaster" > /etc/hosts
