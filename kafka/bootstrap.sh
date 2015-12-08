#!/bin/bash
# Variable
KAFKA_SERVER_IP=192.168.33.10
KAFKA_WWW_LOCATION=http://xenia.sote.hu/ftp/mirrors/www.apache.org/kafka/0.8.2.2/kafka_2.11-0.8.2.2.tgz
KAFKA_PACKAGE_NAME=kafka_2.11-0.8.2.2.tgz
KAFKA_DIR=${KAFKA_PACKAGE_NAME%%.tgz}

# Install Kafka
cd /tmp
wget -O ${KAFKA_PACKAGE_NAME} ${KAFKA_WWW_LOCATION}  
tar xzvf ./${KAFKA_PACKAGE_NAME} -C /usr/local/lib
rm ${KAFKA_PACKAGE_NAME}
cat /vagrant/kafka/server.properties.tpl | sed -e "s/%%KAFKA_IP_ADDRESS%%/${KAFKA_SERVER_IP}/g" >  /usr/local/lib/${KAFKA_DIR}/config/server.properties
cd /usr/local/lib/${KAFKA_DIR}


bin/zookeeper-server-start.sh config/zookeeper.properties &
bin/kafka-server-start.sh config/server.properties &

