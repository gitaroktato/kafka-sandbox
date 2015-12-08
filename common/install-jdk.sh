#!/bin/bash
# Install JDK
apt-get --assume-yes install python-software-properties debconf-utils
add-apt-repository ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt-get --assume-yes install oracle-java8-installer

