#Download and install kafka with dependencies
#Updating repository
sudo apt-get update -y
# Install pakacke JDK 8, net-tools, tree and telnet
sudo apt-get install openjdk-8-jdk net-tools tree telnet -y
#Download kafka Binaries
wget https://downloads.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz
#Extracting Kafka Binaries
tar -xvf kafka_2.13-3.5.0.tgz
#Delete Kafka Binary tar file
rm -rf kafka_2.13-3.5.0.tgz
#Creating soft link of extracted file kafka_2.13-3.5.0 -> kafka
ln -s kafka_2.13-3.5.0 kafka
#create data/logs directory for Kraft
mkdir -p /home/ubuntu/data/server-1/kraft-combined-logs
mkdir -p /home/ubuntu/data/server-2/kraft-combined-logs
mkdir -p /home/ubuntu/data/server-3/kraft-combined-logs
clear
ls -l
echo "-----------------My JDK Version is-----------------"
java -version
