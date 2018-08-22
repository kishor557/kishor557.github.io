#!/bin/bash

echo "Provisioning Farm Tour Dev VM...."

# Run apt-get update first to make sure that we have up-to-date packages.
sudo apt-get -y update
sudo apt-get install -y debconf-utils
sudo apt-get install -y vim curl git build-essential nodejs
sudo apt-get install -y gnupg2
sudo apt-get install -y libtool

echo "Installing RVM, Ruby and Rails"
curl -sSL https://get.rvm.io | bash
source /home/ubuntu/.rvm/scripts/rvm
rvm requirements
rvm install 2.3.1
rvm use 2.3.1 --default
rvm use 2.3.1@gset --create
rvm use 2.3.1@gset
sudo apt-get install libqt4-dev

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

gem install rails -v 5.1.4
gem install passenger -v 5.0.26
sudo apt-get install -y libcurl4-openssl-dev
ruby -v
rails -v



sudo dd if=/dev/zero of=/var/swapfile bs=1M count=1536
sudo chmod 600 /var/swapfile
sudo mkswap /var/swapfile
sudo swapon /var/swapfile
free -m

rvmsudo passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx

wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh
sudo mv init-deb.sh /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx
sudo /usr/sbin/update-rc.d -f nginx defaults
sudo service nginx restart
