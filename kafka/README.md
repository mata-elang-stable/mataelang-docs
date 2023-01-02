# Defense Center - Zookeeper, Kafka, MQTT Source, and Kafka Dashboard


## Prerequisites

- [x] Install [Docker Engine](https://docs.docker.com/engine/install/)
- [x] Install [docker-compose](https://docs.docker.com/compose/install/)

## Services
 - Apache Zookeeper
 - Apache Kafka
 - [Kafka UI by provectuslabs](https://github.com/provectus/kafka-ui)
 - [MQTT Source Service by Mata Elang Team](https://github.com/mata-elang-stable/kafka-mqtt-source)

## Usage

**1. Get `docker-compose.yaml` template from GitHub.**

```bash
curl -o docker-compose.yaml https://github.com/mata-elang-stable/mataelang-docs/kafka/docker-compose.yaml
```

**2. Configure the environment variable in `docker-compose.yaml` file**

Change some parameters in each service that you need in `docker-compose.yaml` file.
    
**3. Start Kafka services and confirm the services are up.**

```
sudo docker-compose up -d
```
### Check running service
```
sudo docker-compose ps
```

**Open the following URL in your browser to see the dashboard.**

- URL: `http://<Kafla Server (e.g. 172.16.2.40)>:9021/`

**You can check received messages by selecting "Topics" -> "sensor_events" -> "Messages" in the dashboard**
