#!/bin/bash
# Variable
ZK_SERVER_IP=$1
KAFKA_SERVER_IP=$2
KAFKA_BROKER_ID=$3
KAFKA_WWW_LOCATION=http://xenia.sote.hu/ftp/mirrors/www.apache.org/kafka/0.8.2.2/kafka_2.11-0.8.2.2.tgz
KAFKA_PACKAGE_NAME=kafka_2.11-0.8.2.2.tgz
KAFKA_DIR=${KAFKA_PACKAGE_NAME%%.tgz}

# Install Kafka
cd /tmp
wget -O ${KAFKA_PACKAGE_NAME} ${KAFKA_WWW_LOCATION}  
tar xzvf ./${KAFKA_PACKAGE_NAME} -C /usr/local/lib
rm ${KAFKA_PACKAGE_NAME}
cat /vagrant/kafka/server.properties.tpl \
	| sed -e "s/%%KAFKA_IP_ADDRESS%%/${KAFKA_SERVER_IP}/g"  \
	| sed -e "s/%%ZOOKEEPER_IP_ADDRESS%%/${ZK_SERVER_IP}/g" \
	| sed -e "s/%%BROKER_ID%%/${KAFKA_BROKER_ID}/g" >  /usr/local/lib/${KAFKA_DIR}/config/server.properties
cd /usr/local/lib/${KAFKA_DIR}

# Creating entrypotnt
echo "/usr/local/lib/${KAFKA_DIR}/bin/kafka-server-start.sh /usr/local/lib/${KAFKA_DIR}/config/server.properties" > /entrypoint.sh
chmod u+x /entrypoint.sh
