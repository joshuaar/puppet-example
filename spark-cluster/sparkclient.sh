#!/bin/bash

sudo yum -y install puppet

#configuration changes
sudo sed -i '/\[main\]/a \ \ \ \ server=puppetmaster' /etc/puppet/puppet.conf
sudo sed -i '/\[main\]/a \ \ \ \ runinterval=30' /etc/puppet/puppet.conf
sudo sed -i '/\[main\]/a \ \ \ \ pluginsync=true' /etc/puppet/puppet.conf

#make a tags directory
sudo mkdir /tags

#define the role
sudo echo sparkclient | sudo tee /tags/.role

#begin polling
sudo puppet resource service puppet ensure=running enable=true

#Hack to submit example spark job (remove this)
sudo crontab -l | { cat; echo "* * * * *  /spark/bin/spark-submit --master spark://sparkmaster:7077 --class TestJob /host_puppet/spark-sample-job/target/analytics-parent-example-job-2.1.0-SNAPSHOT.jar"; } | sudo crontab -
