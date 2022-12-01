# Snort Version 3 Sensor

## Prerequisite

- [x] Install Docker Engine
- [x] Install docker-compose

All required files for sensor installation are placed in `snort` folder

- Dockerfile file is for building the Docker Image. No additional configuration needed.

- local.rules File is an example for implemented snort rules in the docker image. if you want to try the sensor using the example local.rules file, disable the commented line inside the file first.

- pulledpork.conf file is for Snort configuration file to download the rule using the oinkcode. you should define the oinkcode inside the file.

```
oinkcode = <your-oinkcode>
``` 

- snort.lua file is for Snort configuration file that define all variables needed by Snort application. No additional configuration needed.

- start.sh file is an entrypoint file inside the docker image which applied to start the execution of the snort application.

## Usage

**1. Start Snort services and confirm the services are up**

```bash
sudo docker-compose up -d
```

### Check running service

```bash
sudo docker-compose ps
```

- Ensure that Snort and Snort-parser container status is UP
