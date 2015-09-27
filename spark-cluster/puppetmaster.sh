#!/bin/bash
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
sudo yum -y install puppet-server
echo "192.168.33.10 puppetmaster" > /etc/hosts
echo "192.168.33.11 sparkmaster" > /etc/hosts
