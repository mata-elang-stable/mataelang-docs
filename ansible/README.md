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
│   ├── bitnami_kafka.tar <br />
│   ├── bitnami_zookeeper.tar <br />
│   ├── eclipse-mosquitto_2.tar <br />
│   ├── mfscy_kafka-mqtt-source.tar <br />
│   ├── mfscy_snort3-parser.tar <br />
│   ├── mfscy_snort-base_3.tar <br />
│   ├── mfscy_spark_3.3.1-scala2.13.tar <br />
│   ├── opensearchproject_logstash-oss-with-opensearch-output-plugin.tar <br />
│   ├── opensearchproject_opensearch-dashboards.tar <br />
│   ├── opensearchproject_opensearch.tar <br />
│   └── provectuslabs_kafka-ui.tar <br />
├── GeoLite2-City.mmdb Reference: https://github.com/mata-elang-stable/mataelang-platform/wiki/hadoop#install-geolite2 <br />
└── hadoop-3.3.4.tar.gz Reference: https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz <br />

1 directory, 14 files


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


