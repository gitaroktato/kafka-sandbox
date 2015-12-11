#!/bin/bash
ZOOKEEPER_IP_ADDRESS=$1
KAFKA_MANAGER_WWW_LOCATION=https://github.com/yahoo/kafka-manager/archive/1.2.7.tar.gz
KAFKA_MANAGER_PACKAGE_NAME=1.2.7.tar.gz
KAFKA_MANAGER_DIR=kafka-manager-1.2.7

apt-get update
apt-get --assume-yes install zip

wget -O /tmp/${KAFKA_MANAGER_PACKAGE_NAME} ${KAFKA_MANAGER_WWW_LOCATION}
cd /tmp
tar xzvf ./${KAFKA_MANAGER_PACKAGE_NAME}
rm ./${KAFKA_MANAGER_PACKAGE_NAME}
cd ${KAFKA_MANAGER_DIR}
./sbt clean dist

unzip -d /usr/local/lib target/universal/${KAFKA_MANAGER_DIR}.zip
cd /usr/local/lib/${KAFKA_MANAGER_DIR}

cat /vagrant/kafka-manager/application.conf.tpl | sed -e "s/%%ZOOKEEPER_IP_ADDRESS%%/${ZOOKEEPER_IP_ADDRESS}/g" >  /usr/local/lib/${KAFKA_MANAGER_DIR}/conf/application.conf

# Creating entrypotnt
echo "/usr/local/lib/${KAFKA_MANAGER_DIR}/bin/kafka-manager -Dconfig.file=/usr/local/lib/${KAFKA_MANAGER_DIR}/conf/application.conf" > /entrypoint.sh
chmod u+x /entrypoint.sh

