#!/bin/bash
# Variable
ZK_WWW_LOCATION=http://xenia.sote.hu/ftp/mirrors/www.apache.org/zookeeper/zookeeper-3.4.7/zookeeper-3.4.7.tar.gz
ZK_PACKAGE_NAME=zookeeper-3.4.7.tar.gz
ZK_DIR=${ZK_PACKAGE_NAME%%.tar.gz}

# Install Kafka
cd /tmp
wget -O ${ZK_PACKAGE_NAME} ${ZK_WWW_LOCATION}
tar xzvf ./${ZK_PACKAGE_NAME} -C /usr/local/lib
rm ${ZK_PACKAGE_NAME}
cd /usr/local/lib/${ZK_DIR}

cp conf/zoo_sample.cfg conf/zoo.cfg

# Creating entrypotnt
echo "/usr/local/lib/${ZK_DIR}/bin/zkServer.sh start" > /entrypoint.sh
chmod u+x /entrypoint.sh
