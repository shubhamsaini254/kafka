# For Configure Zookeeper Security 
### Install krb5-user and Configure krb5.conf
export DEBIAN_FRONTEND=noninteractive && sudo apt-get install -y krb5-user
### Edit kerberos ticket granting service file
sudo nano /etc/krb5.conf
### Grab zookeeper ticket in zookeeper instances
kinit -kt zookeeper1.service.keytab zookeeeper/<<zookeeper private dns of zookeeper 1 server>>
