# 1. For Configure Zookeeper Security 
### Install krb5-user and Configure krb5.conf
export DEBIAN_FRONTEND=noninteractive && sudo apt-get install -y krb5-user
### Edit kerberos ticket granting service file
sudo nano /etc/krb5.conf
### Grab zookeeper ticket in zookeeper instances
kinit -kt zookeeper1.service.keytab zookeeeper/<<zookeeper private dns of zookeeper 1 server>>
# 2. Configure Kafka
### Copy zookeeper keytab files
Copy zookeeper1.service.keytab, zookeeper2.service.keytab and zookeeper3.service.keytab file to Broker1, Broker2 and Broker3
### Edit kafka_server_jaas.conf
modify all keytab files path as client section. See kafka_server_jaas.conf file for referrence in Broker1, Broker2 and Broker3
