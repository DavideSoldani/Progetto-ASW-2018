#!/bin/bash

echo "======================"
echo "downloading jenkins"
echo "======================"
wget -q -O - http://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install -y jenkins

