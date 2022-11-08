# Bitnami-Kafka


## Prerequisite

- [x] Install Docker Engine
- [x] Install docker-compose command

## Installation

**1. Make clone.**

```
git clone https://gitlab.com/mata-elang/stable/bitnami-kafka.git ~/Confluent
```

**2. Download "kafka-connect-mqtt" of [lensesio/tream-reactor](https://github.com/lensesio/stream-reactor) from GitHub.**

```
wget https://github.com/lensesio/stream-reactor/releases/download/4.0.0/kafka-connect-mqtt-kafka-3-1-4.0.0.zip -P ~/Confluent
```
```
unzip -j ~/Confluent/kafka-connect-mqtt-kafka-3-1-4.0.0.zip -d  ~/Confluent
```

## Configure

**3. Edit "connector.json".**

```
nano ~/Confluent/connector.json
```
- Configuration
```
{
  "name" : "mqtt-source",
  "config" : {
    ...
    "connect.mqtt.hosts" : "tcp://<MQTT broker (e.g. 172.16.2.30)>:1883",
    ...
  }
}
```

## Start Kafka

**4. Start Kafka services and confirm the services are up.**

```
sudo docker-compose -f ~/Confluent/docker-compose.yml up -d
```
```
sudo docker-compose -f ~/Confluent/docker-compose.yml ps
```
- Result
```
     Name                    Command               State                        Ports                    
----------------------------------------------------------------------------------------------------------
broker            /etc/confluent/docker/run        Up       0.0.0.0:9092->9092/tcp,:::9092->9092/tcp, ...
connect           /etc/confluent/docker/run        Up       0.0.0.0:8083->8083/tcp,:::8083->8083/tcp, ...
connect-add       /entrypoint.sh curl -s -X  ...   Exit 7
control-center    /etc/confluent/docker/run        Up       0.0.0.0:9021->9021/tcp,:::9021->9021/tcp
zookeeper         /etc/confluent/docker/run        Up       0.0.0.0:2181->2181/tcp,:::2181->2181/tcp, ...
```

**5. If the connect-add service exits with code 7, run the following command until the exit code is 0.**

- You may need to repeat it several times until all services is up or exit with code 0.
```
sudo docker-compose -f ~/Confluent/docker-compose.yml start connect-add
```
```
sudo docker-compose -f ~/Confluent/docker-compose.yml ps
```
- Result
```
     Name                    Command               State                        Ports                    
----------------------------------------------------------------------------------------------------------
  ...
connect-add       /entrypoint.sh curl -s -X  ...   Exit 0
  ...
```

**6. Check the connector settings with the following command whether it was deployed or not.**

```
curl http://localhost:8083/connectors
```
- Result
```
["mqtt-source"]
```

**7. Open the following URL in your browser to see the dashboard.**

- URL: `http://<Kafla Server (e.g. 172.16.2.40)>:9021/`

**8. You can check received messages by selecting "Topics" -> "snoqttv5"(MQTT Topic) -> "Messages" in the dashboard**
