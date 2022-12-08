# Bitnami-Kafka


## Prerequisites

- [x] Install Docker Engine
- [x] Install docker-compose

## Usage

**1. Configure the environment variable in `.env` file**

You can change the environment of the services in `conf` directory.
- zookeper.env
    Environtment Variable File for customizing the Apache Zookeper   Dockerfile, implemented variable in zookeper.env file is default variable
- kafka.env
    Environtment Variable File for customizing the Kafka Dockerfile, implemented variables in kafka.env are default variables
- mqtt-source.env
    Environtment Variable File for customizing the Dockerfile that connect the MQTT Hosts and Kafka on the server, implemented variables in mqtt-source.env are default variables
- control-center.env
    Environtment Variable File for customizing the Dockerfile that represent the Apache Kafka UI, implemented variables in control-center.env are default variables
    
**2. Start Kafka services and confirm the services are up.**

```
sudo docker-compose up -d
```
### Check running service
```
sudo docker-compose ps
```

**2. Open the following URL in your browser to see the dashboard.**

- URL: `http://<Kafla Server (e.g. 172.16.2.40)>:9021/`

**3. You can check received messages by selecting "Topics" -> "sensor_events" -> "Messages" in the dashboard**
