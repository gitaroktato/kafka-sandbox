# kafka-sandbox

Edit `KAFKA_ADVERTISED_HOST_NAME` in `docker-compose.yml` file.

Start with following command
```bash
docker-compose up
```

Bring up second kafka node
```bash
docker-compose scale kafka=2
```
