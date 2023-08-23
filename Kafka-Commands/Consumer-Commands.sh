# 1. Active Consumer group members
bin/kaka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group group-1 --state

# 2. Active Consumer group members with security
bin/kaka-consumer-groups.sh --bootstrap-server localhost:9092 --command-config consumer-group-client.properties --describe --group group-1 --state
