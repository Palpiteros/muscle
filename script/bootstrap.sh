#!/usr/bin/env bash
cd /vagrant

# Update apt repositories
echo "Updating apt repositories"
apt-get update

# git
echo "Installing git"
sudo apt-get -y install git git-man git-doc gitk

# node.js
echo "Installing Node.js"
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
sudo apt-get -y install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -y install nodejs

# Setup project dependencies
echo "setting up project dependecies"
sudo npm install -g coffee-script
sudo npm install -g handlebars
sudo npm install -g karma
sudo npm install -g karma-mocha
sudo npm install -g karma-coffee-preprocessor
sudo npm install -g karma-phantomjs-launcher
sudo npm install -g karma-chrome-launcher
sudo npm install -g karma-firefox-launcher
sudo npm install -g karma-safari-launcher
sudo npm install -g phantomjs
