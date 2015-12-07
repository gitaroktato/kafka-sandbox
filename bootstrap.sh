#!/bin/bash
# Variable
KAFKA_SERVER_IP=192.168.33.10
KAFKA_WWW_LOCATION=http://xenia.sote.hu/ftp/mirrors/www.apache.org/kafka/0.8.2.2/kafka_2.11-0.8.2.2.tgz
KAFKA_PACKAGE_NAME=kafka_2.11-0.8.2.2.tgz
KAFKA_DIR=${KAFKA_PACKAGE_NAME%%.tgz}

# Install JDK
apt-get --assume-yes install python-software-properties debconf-utils
add-apt-repository ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt-get --assume-yes install oracle-java8-installer

# Install Kafka
cd /tmp
wget ${KAFKA_WWW_LOCATION}  ${KAFKA_PACKAGE_NAME}
tar xzvf ./${KAFKA_PACKAGE_NAME} -C /usr/local/lib
rm ${KAFKA_PACKAGE_NAME}
cat /vagrant/server.properties.tpl | sed -e "s/%%KAFKA_IP_ADDRESS%%/${KAFKA_SERVER_IP}/g" >  /usr/local/lib/${KAFKA_DIR}/config/server.properties
cd /usr/local/lib/${KAFKA_DIR}


bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/kafka-server-start.sh config/server.properties &

