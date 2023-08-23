# List znodes
ls /
ls /cluster

# Get info about "id" znode (This is like cat command)
get /cluster/id

# List topics
ls /config/topics

# Get Acl (Get information about "id" znode)
getAcl /cluster/id

# Create znode with message
create /test-znode "This is message Hello world"

# Create protected znode with Acl
create /protected-znode "znode sasl enabled" sasl:zookeeper/<<KAFKA-SERVER-INTERNAL-DNS>>@KAFKA.SECURE:cdwra

# Create protected znode with Alcs for all zookeeeper internal dns
create /protected-znode2 "znode sasl enabled" 'sasl:zookeeper/<<zokeeper 1 internal dns>>@KAFKA.SECURE:cdrwa,sasl:zookeeper/<<zookeeper 2 internal dns>>@KAFKA.SECURE:cdrwa,sasl:zookeeper/zookeeper 3 internal dns>>@KAFKA.SECURE:cdrwa'

# set Acls for remove all permission for world anyone and zookeeper also. All permissin denied
# So, for this kind of situtation we have to set super user for recover this kind of issue
setAcl /config/topics/secured-topic world:anyone:

# Delete znode
rmr /config/topics/secured-topic

######################## Super User ############################
# In case we remove permission to all then we also don't use that znode so we create super user for this type of scenario

## create digest of password
export ZK_CLASSPATH=~/kafka/conf:~/kafka/libs/*
java -cp $ZK_CLASSPATH org.apache.zookeeper.server.auth.DigestAuthenticationProvider super:superpw
output = super:superpw->super:g9oN2HttPfn8MMWJZ2r45Np/LIA= 
# g9oN2HttPfn8MMWJZ2r45Np/LIA=     this is password

# Edit zookeeper.service file and add this for digest Authentication

Update zookeeper.service file see zookeeper2.service file for example 

# Add super user in zookeeper shell
# Use from kafka machine
export KAFKA_OPTS=-Djava.security.auth.login.config=/home/ubuntu/kafka/config/kafka_server_jaas.conf
kafka/bin/zookeeper-shell.sh <Internal zookeeper instance ip>:2181

addauth digest super:superpw
getAcl /config/topics/secured-topic
setAcl /config/topics/secured-topic world:anyone:r,sasl:zookeeper:cdrwa
setAcl /config/topics/secured-topic world:anyone:,sasl:zookeeper:cdrwa


