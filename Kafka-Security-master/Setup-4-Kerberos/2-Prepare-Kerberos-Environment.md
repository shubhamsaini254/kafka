# Prepare Kerberos environment from kerberos machine
## create principals
```
sudo kadmin.local -q "add_principal -randkey reader@KAFKA.SECURE"
sudo kadmin.local -q "add_principal -randkey writer@KAFKA.SECURE"
sudo kadmin.local -q "add_principal -randkey admin@KAFKA.SECURE"

sudo kadmin.local -q "add_principal -randkey kafka/ec2-3-64-213-181.eu-central-1.compute.amazonaws.com@KAFKA.SECURE"
```
## create keytabs in kerberos machine
```

sudo kadmin.local -q "xst -kt /tmp/reader.user.keytab reader@KAFKA.SECURE"
sudo kadmin.local -q "xst -kt /tmp/writer.user.keytab writer@KAFKA.SECURE"
sudo kadmin.local -q "xst -kt /tmp/admin.user.keytab admin@KAFKA.SECURE"
sudo kadmin.local -q "xst -kt /tmp/kafka.service.keytab kafka/ec2-3-64-213-181.eu-central-1.compute.amazonaws.com@KAFKA.SECURE"

sudo chmod a+r /tmp/*.keytab
```

## download all keytabs to local computer using local machine
```
scp -i ~/kafka-security.pem centos@<<KERBEROS-SERVER-PUBLIC-DNS>>:/tmp/*.keytab /tmp/
```
## copy service keytabs to Kafka-EC2 using local machine
```
scp -i ~/kafka-security.pem /tmp/kafka.service.keytab ubuntu@<<KAFKA-SERVER-PUBLIC-DNS>>:/tmp/
```
## restrict access to keytabs in local machine
```
sudo chmod 600 /tmp/*.keytab
```
## TEST, from local computer
```
export DEBIAN_FRONTEND=noninteractive && sudo apt-get install -y krb5-user
sudo nano /etc/krb5.conf
## replace content by krb5.conf template

kinit -kt /tmp/admin.user.keytab admin
klist
```
## TEST, from Kafka EC2
```
export DEBIAN_FRONTEND=noninteractive ; sudo apt-get install -y krb5-user
sudo nano /etc/krb5.conf
## replace content by krb5.conf template

klist -kt /tmp/kafka.service.keytab
kinit -kt /tmp/kafka.service.keytab kafka/ec2-3-64-213-181.eu-central-1.compute.amazonaws.com
klist
```
## Content of the keytab file -This will show lots of duplicate entry but this is different types of encrytion while creating keytab file

klist -kt kafka.service.keytab


``