# Docker-Spark


## Prerequisites

- [x] Install Docker Engine
- [x] Install docker-compose command

## Configuration
Before starting the service, you must configure the configuration files to match your existing environment. Here are the configuration files that you need to prepare.
  - `.env`
  - `conf/app.properties`
  - `conf/log4j2.properties`
  - `conf/spark-defaults.conf`

## Installation

**1. Start Spark services and confirm the services are up.**

```
sudo docker-compose up -d
```
```
sudo docker-compose ps
```
- Result
```
     Name                    Command               State                        Ports                    
----------------------------------------------------------------------------------------------------------
spark-master     /opt/entrypoint.sh bash -c ...   Up      0.0.0.0:7077->7077/tcp,:::7077->7077/tcp, 0.0.0.0:8180->8080/tcp,:::8180->8080/tcp
spark-worker-1   /opt/entrypoint.sh bash -c ...   Up      0.0.0.0:8181->8081/tcp,:::8181->8081/tcp                                          
spark-worker-2   /opt/entrypoint.sh bash -c ...   Up      0.0.0.0:8182->8081/tcp,:::8182->8081/tcp                                          
spark-worker-3   /opt/entrypoint.sh bash -c ...   Up      0.0.0.0:8183->8081/tcp,:::8183->8081/tcp     
```

# How to submit Spark Application

1. SensorEnrichDataStreamJob
```bash
docker compose exec -it -w /opt/spark spark-master /opt/spark/bin/spark-submit \
     --master spark://spark-master:7077 \
     --class org.mataelang.kaspacore.jobs.SensorEnrichDataStreamJob \
     --total-executor-cores 1 \
     --conf spark.submit.deployMode=cluster \
     --conf spark.executor.cores=1 \
     --conf spark.executor.memory=1g \
     --files conf/app.properties \
     hdfs://172.17.0.1:9000/user/hadoop/kaspacore/files/kaspacore.jar
```
2. SensorAggregationStreamJob
```bash
docker compose exec -it -w /opt/spark spark-master /opt/spark/bin/spark-submit \
     --master spark://spark-master:7077 \
     --class org.mataelang.kaspacore.jobs.SensorAggregationStreamJob \
     --total-executor-cores 1 \
     --conf spark.submit.deployMode=cluster \
     --conf spark.executor.cores=1 \
     --conf spark.executor.memory=1g \
     --files conf/app.properties \
     hdfs://172.17.0.1:9000/user/hadoop/kaspacore/files/kaspacore.jar
```
