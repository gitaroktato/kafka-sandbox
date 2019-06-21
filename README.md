# kafka-sandbox
Run a sample Kafka cluster with kafka-manager using Docker and docker-compose

Edit `KAFKA_ADVERTISED_HOST_NAME` in `docker-compose.yml` file.

Start with following command
```bash
docker-compose up
```

Bring up second kafka node
```bash
docker-compose scale kafka=2
```

Kafka manager is available at `http://${DOCKER_HOST}:9000`
Zookeeper web UI is running at `http://${DOCKER_HOST}:9000`
