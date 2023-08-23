# Setup Kerberos - Need elastic IP for long term period

## Infrastructure preparation
* launch a new t2.micro EC2 instance
* new security_group, open port 88 for "my ip" and the Kafka EC2 instance
  * port 88 and as source the P R I V A T E-IP of Kafka Broker, CIDR notation ( 172.31.26.230/32 )
  * port 88 and as source "my ip"
* use the same kafka-security.pem file as for the other EC2, for ssh access
* pick the public IP of the new instance and edit the security_group of the Kafka-EC2 to also allow Port 88 from "my ip" and the public-IP of the new Kerberos-EC2

##  setup Kerberos server  
```
sudo yum install -y krb5-server
```
sudo nano /var/kerberos/krb5kdc/kdc.conf  [](./kdc.conf)
sudo nano /var/kerberos/krb5kdc/kadm5.acl [](./kadm5.acl)
sudo nano /etc/krb5.conf                  [](./krb5.conf)

* copy *kdc.conf* to directory /var/kerberos/krb5kdc/ [kdc.conf file >>](./kdc.conf)
* copy *kadm5.acl* to directory /var/kerberos/krb5kdc/ [kadm5.acl file >>](./kadm5.acl)
* copy *krb5.conf* to directory /etc/ [krb5.conf_file_>>](./krb5.conf)

## prepare Kerberos environment
```
export REALM="KAFKA.SECURE"
export ADMINPW="this-is-unsecure"

```
## Create kerberos database

sudo /usr/sbin/kdb5_util create -s -r KAFKA.SECURE -P this-is-unsecure

## Create admin principle

sudo kadmin.local -q "add_principal -pw this-is-unsecure admin/admin"

## Restart Services

sudo systemctl restart krb5kdc
sudo systemctl restart kadmin

## check services
```
sudo systemctl status krb5kdc
sudo systemctl status kadmin
```
