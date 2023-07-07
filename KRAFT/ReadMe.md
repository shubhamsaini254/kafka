#### 1. Download Kafka Binaries Latest Version
#### 2. Create UUID (Cluster ID) then copy UUID for future use
bin/kafka-storage.sh random-uuid
#### 3. Format the logs directory
bin/kafka-storage.sh format -t enter-uuid-here -c config/kraft/server.properties
#### 4. Start Kafka using Kraft configuration
bin/kafka-server-start.sh config/kraft/server.properties
#### 5. Login into Kraft shell
bin/kafka-metadata-shell.sh --snapshot /tmp/server-1/kraft-combined-logs/__cluster_metadata-0/00000000000000000000.log
#### 6. Check cluster status
bin/kafka-metadata-quorum.sh --bootstrap-server 172.31.8.57:9092 describe --status
#### 7. Check replication staus
bin/kafka-metadata-quorum.sh --bootstrap-server 172.31.8.57:9092 describe --replication
