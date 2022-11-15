# Bitnami-Kafka


## Prerequisite

- [x] Install Docker Engine
- [x] Install docker-compose

## Usage

**1. Configure the environment variable in `.env` file**

You can change the environment of the services in `conf` directory.

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
