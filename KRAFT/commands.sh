# This is admin commands for manage or get data about cluster of Kraft

# Create UUID (Cluster ID) then copy UUID for future use
bin/kafka-storage.sh random-uuid

# Format the logs directory
bin/kafka-storage.sh format -t <enter uuid here> -c config/kraft/server.properties

# Login into Kraft shell
bin/kafka-metadata-shell.sh --snapshot /tmp/server-1/kraft-combined-logs/__cluster_metadata-0/00000000000000000000.log

# Check cluster status
bin/kafka-metadata-quorum.sh --bootstrap-server 172.31.8.57:9092 describe --status

# Check replication staus
bin/kafka-metadata-quorum.sh --bootstrap-server 172.31.8.57:9092 describe --replication

# Debug Log Segments
bin/kafka-dump-log.sh --cluster-metadata-decoder --files data/kraft-combined-logs/__cluster_metadata-0/00000000000000000000.log
