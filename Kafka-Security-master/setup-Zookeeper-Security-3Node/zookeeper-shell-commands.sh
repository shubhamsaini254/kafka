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

# set Acls for remove all permission for world anyone
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

# Edit zookeepr.service file and add this
