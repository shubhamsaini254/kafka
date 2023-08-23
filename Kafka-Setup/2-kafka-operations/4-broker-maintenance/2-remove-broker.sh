########
#### ADMIN MACHINE
########

export ZK_HOST="172.31.9.21:2181"

# Documentation: https://github.com/linkedin/kafka-tools/wiki/module-remove

# Remove broker 4
#Remove the broker with ID 4 from the cluster, replacing with all other brokers in the cluster

kafka-assigner -z $ZK_HOST -g remove -b 4 

# Execute 
kafka-assigner -z $ZK_HOST -e remove -b 4

#Process To Do This--------Addedd Lines
#1. Check data for broker 4 
#ssh into broker 4

ls /data/kafka

#Then generate kafka-assigner in admin machine and see the upcoming changes
#Then execute the broker remove.
#For more details follow link - https://github.com/linkedin/kafka-tools/wiki/module-remove
#After sometime broker 4 data will be moved to other brokers
#Go to Kafka-Manager and disable then enable culster then click on broker no. 4 if nothing found then it works
#Remove Broker using cloud formation (3-kafka.yml) > kafka 4 create = false
#Remove kafka resources - (2-kafka-fixed.yml) using cloud formation > kafka 4 create = false
#remove entry from proemtheus server.
#All done. You have succuessfully removed broker 4 from cluster.
