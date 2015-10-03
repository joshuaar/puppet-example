#!/bin/bash

sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
sudo yum -y install puppet-server

#give puppetmaster all the dns names it could be contacted with
sudo sed -i '/\[main\]/a \ \ \ \ dns_alt_names=puppetmaster' /etc/puppet/puppet.conf

#link the modules
sudo puppet module install puppetlabs-stdlib
sudo puppet module install elasticsearch-elasticsearch
ln -s /host_puppet/modules/spark /etc/puppet/modules/spark
ln -s /host_puppet/modules/oha-facts /etc/puppet/modules/oha-facts
ln -s /host_puppet/manifests/site.pp /etc/puppet/manifests/site.pp

#register the custom facts
echo "FACTERLIB=/host_puppet/facts" >> /etc/environment


#start the puppet master
sudo puppet master

#cronjob to sign any certs that come in
sudo crontab -l | { cat; echo "* * * * *  puppet cert sign --all"; } | sudo crontab -

#start the puppet master on boot
sudo echo "puppet master" >> /etc/rc.d/rc.local
