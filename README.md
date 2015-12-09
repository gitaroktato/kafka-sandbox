# kafka-sandbox
Start with following command
```bash
vagrant up
```
Bring up management node
```bash
vagrant up manager
```

Bring up third kafka node
```bash
vagrant up kafka3
```



# Hosts

| Address           |  Role      | 
|--------------------|-----------|
| 192.168.33.10:2181 | Zookeeper |
| 192.168.33.11:9092 | Kafka node |
| 192.168.33.12:9092 | Kafka node |
| 192.168.33.13:9092 | Kafka node |
| 192.168.33.14:9000 | Yahoo kafka manager |

