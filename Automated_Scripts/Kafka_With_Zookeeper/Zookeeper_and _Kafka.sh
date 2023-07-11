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

