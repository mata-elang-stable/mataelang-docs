# Offline Installation

## Prerequisites

- [x] Install Python 3.8
- [x] Install ansible
- [x] Install sshpass

All mata elang components are already included inside `roles` folder that described below:

- `hadoop` folder contain the automation folder for implementing the Mata Elang Hadoop component.
- `kafka_docker` folder contain the automation folder for implementing the Mata Elang Kafka component.
- `opensearch_docker` folder contain the automation folder for implementing the Mata Elang  OpenSearch component.
- `snort_sensor` folder contain the automation folder for implementing the Mata Elang Sensor Snort component.
- `spark_docker` folder contain the automation folder for implementing the Mata Elang Spark and Kaspacore component.

Make sure that all required files are already stored in `files` folder, the necessary component that required by the ansible are described below:


├── amazon-corretto-11-x64-linux-jdk.tar.gz Reference: https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz <br />
├── docker_images <br />
│   ├── confluentinc_cp-kafka.tar `confluentinc/cp-kafka:7.3.0` <br />
│   ├── confluentinc_cp-zookeeper.tar `confluentinc/cp-zookeeper:7.3.0` <br />
│   ├── eclipse-mosquitto_2.tar `eclipse-mosquitto:2.0.15` <br />
│   ├── mataelang_kafka-mqtt-source. `mataelang/kafka-mqtt-source:1.1` <br />
│   ├── mataelang_snort3-parser.tar `mataelang/snort3-parser:1.1` <br />
│   ├── mataelang_snort-base_3.tar `mataelang/snort-base:3` <br />
│   ├── mataelang_spark_3.3.1-scala2.13.tar `mataelang/spark:3.3.1-scala2.13` <br />
│   ├── opensearchproject_logstash-oss-with-opensearch-output-plugin.tar `opensearchproject/logstash-oss-with-opensearch-output-plugin:8.4.0` <br />
│   ├── opensearchproject_opensearch-dashboards.tar `opensearchproject/opensearch-dashboards:2.4.0` <br />
│   ├── opensearchproject_opensearch.tar `opensearchproject/opensearch:2.4.0` <br />
│   └── provectuslabs_kafka-ui.tar `provectuslabs/kafka-ui` <br />
├── docker-20.10.9.tgz Reference: https://download.docker.com/linux/static/stable/x86_64/ <br />
├── GeoLite2-City.mmdb Reference: https://github.com/mata-elang-stable/mataelang-platform/wiki/hadoop#install-geolite2 <br />
└── hadoop-3.3.4.tar.gz Reference: https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz <br />

1 directory, 14 files

# How to export Docker image file
1. First you need to pull all image required by Mata Elang Platform. 
    You can use [docker-compose.yaml](https://gitlab.com/mata-elang/stable/prototype-asset/-/raw/main/all-in-one/docker-compose.yaml) from `all-in-one` directory to pull image easily using `docker compose pull`.
2. Export to file
    Here is the command to export from Docker Image to tar file. You need to run one-by-one for every image.
    ```bash
    docker save -o exported_image_name.tar mataelang/snort-base:3
    ```

## Usage

**1. Edit `inventory` file.**
<p>copy the `inventory.example` file to `inventory`. This file define the grouping for each hostname that going to installed with ansible automation. Each group need to defined the username, password, and the root password for the SSH process in ansible</p>

There are 5 groups in `inventory` file that should be configure as described below:
1. [sensor] group
    <p> this group will execute the tasks for sensor ansible role in Mata Elang component. other spesific variable that should be defined in this group is the `sensor_network_interface`. Make sure it is already same with the network interface thay you want to be monitored.</p>

2. [hadoop] group
    <p> this group will execute the tasks for hadoop ansible role in Mata Elang component. There is no other spesific configuration needed for this component.</p>

3. [kafka] group
    <p> this group will execute the tasks for kafka ansible role in Mata Elang component. There is no other spesific configuration needed for this component.</p>

4. [spark] group
    <p> this group will execute the tasks for spark ansible role in Mata Elang component. There is no other spesific configuration needed for this component.</p>

5. [opensearch] group
    <p> this group will execute the tasks for opensearch ansible role in Mata Elang component. There is no other spesific configuration needed for this component.</p>

This is an example line for ansible inventory file:
```
[all:vars]
ansible_ssh_user=username
ansible_ssh_password=password
ansible_become_password=password

[sensor]
192.168.56.11 sensor_network_interface=enp0s8

[hadoop]
192.168.56.101

[kafka]
192.168.56.101

[spark]
192.168.56.101

[opensearch]
192.168.56.101
```
**2. Edit default variable**
<p>Open `defaults` -> `main.yml` file and edit necessary variable for each component that necessary. The current configuration for variables are default configuration.</p>

**3. Start Ansible Process**
<p>Open the terminal with this current project directory and start the ansible using this command:</p>

```bash
ansible-playbook -i inventory site.yaml
```


