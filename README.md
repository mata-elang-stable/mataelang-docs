# Mata Elang
This project currently in active development of 1.1 version
# Installations
## Components
Mata Elang project, consists of following general components, and the technologies:
- Host OS: Ubuntu 20.04 LTS
- Container Runtime: 
	- Docker Engine 20.10.12
	- Docker Compose 1.25.0
- Java / OpenJDK: 17.0.5 LTS
- Snort: 3.1.39 (or later)
- PulledPork: Upgraded to PulledPork3
- Mosquitto: 1.6.9
- Confluent / Kafka: - / 3.3.1
- Apache Spark: 3.3.1
- Scala: 2.13
- Hadoop: 3.3.4 (or later)
- Cassandra: - (not used in this 1.1 version)
- ELK stack: 8.3.2
- Zabbix: 6.0.1 LTS
- MariaDB: 10.6.8 LTS
- Apache HTTP Server: 2.4.54
- Ansible

### Processing Stages Components
- Sensor: Snort
- Data Collection: Apache Kafka, MQTT broker, 
- Data Processing: Apache Spark, Kaspa Core
- Data Store: ElasticSearch / OpenSearch
- Data Presentation: Kibana

## Requirements
### Software
- Operating System: Ubuntu 20.04 / Debian 9 based OS
- Docker
### Hardware
#### Sensor
- CPU Core 2 Duo
- Gigabit LAN card
- 2 GB of RAM
- 100 GB of HDD

#### Data Processing
- CPU Intel Core i7 / AMD Ryzen 7
- Gigabit LAN card
- 16 GB of RAM
- 500 GB of HDD
#### Data Storage
- CPU Intel Core i3 / AMD Ryzen 3
- Gigabit LAN card
- 4 GB of RAM
- 1 TB of HDD
#### Data Presentation
- CPU Intel Core 2 Duo
- LAN card
- 4 GB of RAM
- 500 GB of HDD
## Install Preparations
### Installation Media Procedures
Currently we're using USD drive to store all dependencies for the project.
## Offline Installations
For offline installation purpose, we will be using the Ansible technology to automate the process.
Please refer to [this](ansible/README.md) folder for Ansible offline install
## Online Installations
For the online installation you need a stable internet connection to download all necessary dependencies and components from our repository.
There are 2 method for online installation :
1. [Manual Installation](#manual-installation)
2. [Automated Installation](#automated-installation)

#### Manual Installation
For manual Mata Elang components installation there are several folders in this repository that contain the guidance for the installation :

1. Sensor Snort : [sensor](sensor/README.md) folder
2. Mosquitto (MQTT Broker): [mosquitto](mosquitto/README.md) folder
3. Apache Kafka : [kafka](kafka/README.md) folder
4. Kaspacore & Apache Spark : [spark](spark/README.md) folder
5. OpenSearch & OpenSearch Dasboard: [opensearch](opensearch/README.md) folder

#### Automated Installation
For automated Mata Elang components installation will be applied using Ansible Automation process that refer to this repository:

- Change to Root Directory
```bash
cd ~/
```

- Clone Git Repository
```bash
git clone https://gitlab.com/mata-elang/stable/mataelang-ansible-roles.git
```

For more Automated Installation procedure could be referred to: https://gitlab.com/mata-elang/stable/mataelang-ansible-roles

