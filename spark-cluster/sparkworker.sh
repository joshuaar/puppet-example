#!/bin/bash
sudo yum -y install puppet

#won't need to do this if dns server is present
echo "192.168.33.10 puppetmaster" >> /etc/hosts
echo "192.168.33.11 sparkmaster" >> /etc/hosts
echo "192.168.33.12 sparkworker" >> /etc/hosts

#configuration changes
sudo sed -i '/\[main\]/a \ \ \ \ server=puppetmaster' /etc/puppet/puppet.conf
#sudo sed -i '/\[main\]/a \ \ \ \ runinterval=0' /etc/puppet/puppet.conf

#begin polling
sudo puppet resource service puppet ensure=running enable=true
