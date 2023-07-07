### 1. Download Kafka Binaries Latest Version
### 2. Create UUID (Cluster ID) then copy UUID for future use
bin/kafka-storage.sh random-uuid
### 3. Format the logs directory
bin/kafka-storage.sh format -t <enter uuid here> -c config/kraft/server.properties
### 4. Login into Kraft shell
bin/kafka-metadata-shell.sh --snapshot /tmp/server-1/kraft-combined-logs/__cluster_metadata-0/00000000000000000000.log
