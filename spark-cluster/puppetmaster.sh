#!/bin/bash
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
sudo yum -y install puppet-server

#won't need to do this if dns server is present
echo "192.168.33.10 puppetmaster" >> /etc/hosts
echo "192.168.33.11 sparkmaster" >> /etc/hosts
echo "192.168.33.12 sparkworker" >> /etc/hosts

#give puppetmaster all the dns names it could be contacted with
sudo sed -i '/\[main\]/a \ \ \ \ dns_alt_names=puppetmaster' /etc/puppet/puppet.conf

#link the modules
sudo puppet module install puppetlabs-stdlib
ln -s /host_puppet/modules/spark /etc/puppet/modules/spark
ln -s /host_puppet/manifests/site.pp /etc/puppet/manifests/site.pp

#start the puppet master
sudo puppet master

#cronjob to sign any certs that come in
sudo crontab -l | { cat; echo "* * * * *  puppet cert sign --all"; } | sudo crontab -
