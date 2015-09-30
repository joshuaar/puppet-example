#!/bin/bash

sudo yum -y install puppet

#configuration changes
sudo sed -i '/\[main\]/a \ \ \ \ server=puppetmaster' /etc/puppet/puppet.conf
sudo sed -i '/\[main\]/a \ \ \ \ runinterval=30' /etc/puppet/puppet.conf

#begin polling
sudo puppet resource service puppet ensure=running enable=true
