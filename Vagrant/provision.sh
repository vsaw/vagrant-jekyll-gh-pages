#!/bin/bash

if [[ ! -f /etc/init.d/jekyll ]]; then
    # Set locale
    sudo locale-gen UTF-8

    # Install Jekyll pre-requisits
    sudo apt-get update
    #sudo apt-get upgrade --yes
    sudo apt-get install ruby1.9.1-dev nodejs zlib1g-dev --yes

    # Install the GitHub Jekyll bundle
    sudo gem install bundler
    cp /vagrant/Vagrant/Gemfile.src /vagrant/Gemfile
    cd /vagrant
    sudo bundle install

    # Install Jekyll as a service
    sudo cp /vagrant/Vagrant/jekyll_init_d.sh /etc/init.d/jekyll
    sudo chmod 755 /etc/init.d/jekyll
    sudo update-rc.d jekyll defaults
fi

sudo service jekyll start
