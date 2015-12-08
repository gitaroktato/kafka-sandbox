#!/bin/bash
KAFKA_MANAGER_WWW_LOCATION=https://github.com/yahoo/kafka-manager/archive/1.2.7.tar.gz
KAFKA_MANAGER_PACKAGE_NAME=1.2.7.tar.gz
KAFKA_MANAGER_DIR=kafka-manager-1.2.7

apt-get update
apt-get --assume-yes install zip

wget -O /tmp/${KAFKA_MANAGER_PACKAGE_NAME} ${KAFKA_MANAGER_WWW_LOCATION}
cd /tmp
tar xzvf ${KAFKA_PACKAGE_NAME}
cd ${KAFKA_MANAGER_DIR}
sbt clean dist


