
# Copyright 2015 Yahoo Inc. Licensed under the Apache License, Version 2.0
# See accompanying LICENSE file.

# This is the main configuration file for the application.
# ~~~~~

# Secret key
# ~~~~~
# The secret key is used to secure cryptographics functions.
# If you deploy your application to several instances be sure to use the same key!
application.secret="changeme"
application.secret=${?APPLICATION_SECRET}

# The application languages
# ~~~~~
application.langs="en"

# Global object class
# ~~~~~
# Define the Global object class for this application.
# Default to Global in the root package.
# global=Global

# Database configuration
# ~~~~~ 
# You can declare as many datasources as you want.
# By convention, the default datasource is named `default`
#
# db.default.driver=org.h2.Driver
# db.default.url="jdbc:h2:mem:play"
# db.default.user=sa
# db.default.password=
#
# You can expose this datasource via JNDI if needed (Useful for JPA)
# db.default.jndiName=DefaultDS

# Evolutions
# ~~~~~
# You can disable evolutions if needed
# evolutionplugin=disabled

# Ebean configuration
# ~~~~~
# You can declare as many Ebean servers as you want.
# By convention, the default server is named `default`
#
# ebean.default="models.*"

# Logger
# ~~~~~
# You can also configure logback (http://logback.qos.ch/), by providing a logger.xml file in the conf directory .

# Root logger:
logger.root=ERROR

# Logger used by the framework:
logger.play=INFO

# Logger provided to your application:
logger.application=DEBUG

kafka-manager.zkhosts="kafka-manager-zookeeper:2181"
kafka-manager.zkhosts=${?ZK_HOSTS}
pinned-dispatcher.type="PinnedDispatcher"
pinned-dispatcher.executor="thread-pool-executor"

