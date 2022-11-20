# Docker-Spark


## Prerequisite

- [x] Install Docker Engine
- [x] Install docker-compose command

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
