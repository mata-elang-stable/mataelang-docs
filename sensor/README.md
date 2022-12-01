# Snort Version 3 Sensor

## Prerequisite

- [x] Install Docker Engine
- [x] Install docker-compose

All required files for sensor installation are placed in `snort` folder
- Dockerfile file is for building the Docker Image. No additional configuration needed
- local.rules File is an example for implemented snort rules in the docker image. if you want to try the sensor using the example local.rules file, disable the commented line inside the file first
- Pulledpork.conf file is for snort configuration file to download the rule using the oinkcode. you should define the oinkcode inside the file.
```
oinkcode = <your-oinkcode>
``` 
- Snort.lua file is for snort configuration file that define all variables needed in snort image. No additional configuration needed

## Usage

**1. Configur**
