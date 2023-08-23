# Service File Info
In service file of kafka.service we have configured Environment="KAFKA_OPTS=security class and path of jaas.conf and
Prometheus node exporter. we can use only one environment variable in service file. We can't mention twice
# kafka_server_jaas.conf
This file shold be inside this path /home/ubuntu/kafka/config/kafka_server_jaas.conf
Make sure to enter Public DNS of broker1 in broker1 jaas file. 
