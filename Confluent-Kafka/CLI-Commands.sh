# The local commands are intended for a single-node development environment only, NOT for production usage. See more: https://docs.confluent.io/current/cli/index.html

Confluent Commands
--------------------
# Start Confluent Services
confluent local services start
# Check status of active services
confluent local services status
# Start/Stop/Status check of specific services
confluent local services ksql-server start/stop/status
# Produce Message in topic
confluent local services kafka produce my-topic
# Consume Messages 
confluent local services kafka consume my-topic --from-beginning
