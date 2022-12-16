
<div align="center">
  <img src=".images/mata-elang-stable-logo.png" alt="logo" width="200">
  <h2>Mata Elang</h2>
  <h3>Backup Documentation</h3>
</div>

## Introduction
For backup related proccess we're using Elastic dump. Elasticdump is an import/export tool for ES to backup / restore ES indices into JSON file, and store it in a file.

## Preparations
Elasticdump can be obtained from NPM repository.

### Installations
#### Install NPM

```bash
sudo apt install nodejs
sudo apt install npm
```

#### Verify NPM version

```bash
npm --version
6.14.4

node --version
v10.19.0
```

#### Install Elasticdump
```bash
sudo npm install elasticdump -g
```

#### Verify Elasticdump Installation
```bash
elasticdump

Error Emitted => {"errors":["`input` is a required input","`output` is a required input"]}
```
**This line indicate that elasticdump already installed on the device**

#### Create Backup Folder
```bash
mkdir os-backup

cd os-backup

pwd
/home/hduser/os-backup <Could be placed in other directory>
```


### Backup Examples

#### Backup Index Data Into File 

**1. Backup the mapping of the index data**
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=https://<YOUR_OPENSEARCH_USERNAME>:<YOUR_OPENSEARCH_PASSWORD>@<YOUR_HOST_IP>:9200/<YOUR_INDEX_NAME> --output=/<YOUR_DIRECTORY>/os-backup/<YOUR_BACKUP_FILE_NAME>_mapping.json --type=mapping
```

example :
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=https://admin:admin@localhost:9200/event-all-10s-* --output=/home/hduser/os-backup/event_all_10s_mapping.json --type=mapping
```

**2. Backup the data of the index**
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=https://<YOUR_OPENSEARCH_USERNAME>:<YOUR_OPENSEARCH_PASSWORD>@<YOUR_HOST_IP_ADDRESS>:9200/<YOUR_INDEX_NAME> --output=/<YOUR_DIRECTORY>/os-backup/<YOUR_BACKUP_FILE_NAME>.json --type=data
```

example :
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=https://admin:admin@localhost:9200/event-all-10s-* --output=/home/hduser/os-backup/event_all_10s.json --type=data
```
if the dumping process complete, here is example message that should appear in your device :
```
sent 100 objects to destination elasticsearch, wrote 100
got 0 objects from source file (offset: 2100)
got 0 objects from source file (offset: 2100)
Total Writes: 2100
dump complete
```
**3. verify the backup file in os-backup directory**
There should be 2 .json type file that indicate the mapping of the index data and the backup data itself inside the os-backup directory.

```
ls <YOUR_DIRECTORY>/os-backup
event_all_10s.json  event_all_10s_mapping.json (example file)
```

#### Restore Backup File into Index Data
**1. Restore the mapping of index data**
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=/<YOUR_DIRECTORY>/os-backup/<YOUR_BACKUP_FILE>_mapping.json --output=https://<YOUR_OPENSEARCH_USERNAME>:<YOUR_OPENSEARCH_PASSWORD>@<YOUR_HOST_IP_ADDRESS>:9200/<YOUR_INDEX_NAME> --type=mapping
```
example :
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=/home/hduser/os-backup/event_all_10s_mapping.json --output=https://admin:admin@localhost:9200/event-all-10s-backup --type=mapping
```
**2. Restore the data of the index**
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=/<YOUR_DIRECTORY>/os-backup/<YOUR_BACKUP_FILE>.json --output=https://<YOUR_OPENSEARCH_USERNAME>:<YOUR_OPENSEARCH_PASSWORD>@<YOUR_HOST_IP_ADDRESS>:9200/<YOUR_INDEX_NAME> --type=data
```
example :
```
NODE_TLS_REJECT_UNAUTHORIZED=0 elasticdump --input=/home/hduser/os-backup/event_all_10s.json --output=https://admin:admin@localhost:9200/event-all-10s-backup --type=data
```

if the dumping process complete, here is example message that should appear in your device :
```
sent 100 objects to destination elasticsearch, wrote 100
got 0 objects from source file (offset: 2100)
got 0 objects from source file (offset: 2100)
Total Writes: 2100
dump complete
```
**3. Verify the restored data in your index pattern**
- via Dashboard
  - check on Index Pattern tab
  ![image.png](.images/backup/image.png)
  - click on the Create Index Pattern Button, and check if your restored index data name already seen in the pattern
  ![image-1.png](.images/backup/image-1.png)
- via curl
using this command :
```
curl https://<YOUR_OPENSEARCH_USERNAME>:<YOUR_OPENSEARCH_PASSWORD>@<YOUR_HOST_IP_ADDRESS>:9200/<YOUR_INDEX_DATA_NAME>/_search
```

example:
```
curl https://admin:admin@localhost:9200/event-all-10s-backup/_search
```

Output:
![image-2.png](.images/backup/image-2.png)

Note:
if you have a problem with your TLS certificate, please use this command :
```
curl https://<YOUR_OPENSEARCH_USERNAME>:<YOUR_OPENSEARCH_PASSWORD>@<YOUR_HOST_IP_ADDRESS>:9200/<YOUR_INDEX_DATA_NAME>/_search --insecure
```
## References
- https://fitdevops.in/elasticdump-to-backup-restore-indexes/

