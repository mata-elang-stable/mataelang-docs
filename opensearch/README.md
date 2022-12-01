# OpenSearch

## Prerequisite

- [x] Install Docker Engine
- [x] Install docker-compose

## Usage

**1. Configure Stream Pipeline Configuration in `pipeline.conf` file.**

- You need to configure the input variable in pipeline.conf
```
bootstrap_servers => "<YOUR_DOCKER_IP_ADDRESS>"
topics => "<YOUR_KAFKA_TOPIC_STREAM>"
```
- You need to configure the output variable in pipeline.conf
```
opensearch {
     hosts => ["https://opensearch-node1:9200", "https://opensearch-node2:9200"]
     index => "{INDEX_NAME(e.g. event-all-10s-)}%{+YYYY.MM.dd}"
     user => "admin"
     password => "admin"
     ssl => true
     ssl_certificate_verification => false
   }

```

**2. Start OpenSearch services and confirm the services are up.**
```
sudo docker-compose up -d
```
### Check running service
```
sudo docker-compose ps
```
**3. Open the following URL in your browser to see the dashboard.**

- URL: `http://<OpenSearch Dashboard (e.g. 10.10.10.40)>:5061/`
![image-1.png](./image-1.png)
**4. On the Dashboard sidebar go to "Stack Management" -> "Index Pattern" -> "Create Index Pattern"**
![image.png](./image.png)
**5. Go to "Stack Management" -> "Index Pattern" -> "Saved Object" and import `mata-elang-template.ndjson` file for dashboard visualization**
![image-2.png](./image-2.png)
