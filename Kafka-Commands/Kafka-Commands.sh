# List cluster topics with SSL port - make sure to mention your public dns here before :9093
kafka/bin/kafka-topics.sh --bootstrap-server ec2-13-235-95-72.ap-south-1.compute.amazonaws.com:9093 --list --command-config ssl/client.properties
