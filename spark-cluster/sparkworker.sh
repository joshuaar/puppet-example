#!/bin/bash

sudo yum -y install puppet

#configuration changes
sudo sed -i '/\[main\]/a \ \ \ \ server=puppetmaster' /etc/puppet/puppet.conf
sudo sed -i '/\[main\]/a \ \ \ \ runinterval=30' /etc/puppet/puppet.conf
sudo sed -i '/\[main\]/a \ \ \ \ pluginsync=true' /etc/puppet/puppet.conf

#make a tags directory
sudo mkdir /tags

#define the role
sudo echo sparkworker | sudo tee /tags/.role

#begin polling
sudo puppet resource service puppet ensure=running enable=true
