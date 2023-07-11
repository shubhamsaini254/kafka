# Update Repository
sudo apt-get update -y
# Install jdk, net-tools and tree package
sudo apt-get install openjdk-8-jdk net-tools tree -y
# Download Kafka Binaries - check url if not working
wget https://downloads.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz
# Extract kafka Binary
tar -xvf kafka_2.13-3.5.0.tgz
# Delete Kafka binary
rm kafka_2.13-3.5.0.tgz
# Create soft link of kafka binaries to kafka
ls -s kafka_2.13-3.5.0 kafka
# Create systemd file for zookeeper
cat << EOF | sudo tee /etc/systemd/system/zookeeper.service > /dev/null
[Unit]
Description=zookeeper
After=network.target

[Service]
# User=ec2-user
# Group=ec2-user
Environment="KAFKA_HEAP_OPTS=-Xmx256M -Xms128M"
# Environment="KAFKA_OPTS=-javaagent:/home/ec2-user/prometheus/jmx_prometheus_javaagent-0.3.1.jar=8080:/home/ec2-user/prometheus/kafka-0-8-2.yml"
ExecStart=/home/ubuntu/kafka/bin/zookeeper-server-start.sh /home/ubuntu/kafka/config/zookeeper.properties
ExecStop=/home/ubuntu/kafka/bin/zookeeper-server-stop.sh
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF
#Create systemd file for Kafka
cat << EOF | sudo tee /etc/systemd/system/kafka.service > /dev/null
[Unit]
Description=Kafka
After=network.target zookeeper.service
Requires=zookeeper.service

[Service]
# User=ec2-user
# Group=ec2-user
Environment="KAFKA_HEAP_OPTS=-Xmx256M -Xms128M"
# Environment="KAFKA_OPTS=-javaagent:/home/ec2-user/prometheus/jmx_prometheus_javaagent-0.3.1.jar=8080:/home/ec2-user/prometheus/kafka-0-8-2.yml"
#ExecStartPre=/bin/sleep 30
ExecStart=/home/ubuntu/kafka/bin/kafka-server-start.sh /home/ubuntu/kafka/config/server.properties
ExecStop=/home/ubuntu/kafka/bin/kafka-server-stop.sh
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF
# Working...
