#!/bin/bash
#won't need to do this if dns server is present
echo "127.0.0.1 localhost" > /etc/hosts
echo "192.168.33.10 puppetmaster" >> /etc/hosts
echo "192.168.33.11 sparkmaster" >> /etc/hosts
echo "192.168.33.12 sparkworker" >> /etc/hosts


