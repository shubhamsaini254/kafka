# 1. Setup environment variable called SRVPASS just to be able to use interactive commands to create certificates

export SRVPASS=serversecret

# 2. Creating Kafka Broker/Server Certificate
cd /home/ubuntu/ssl

keytool -genkey -keystore kafka.server.keystore.jks -validity 365 -storepass $SRVPASS -keypass $SRVPASS  -dname "CN=ec2-3-64-213-181.eu-central-1.compute.amazonaws.com" -storetype pkcs12
        # This will create "kafka.server.keystore.jks" file.

ls -l
        # Check quick look at the content of "kafka.server.keystore.jks" file

keytool -list -v -keystore kafka.server.keystore.jks
        # enter "serversecret" as password of file because we have set it in SRVPASS variable

# 3. Get a signed version of the certificate for our Kafka broker
keytool -keystore kafka.server.keystore.jks -certreq -file cert-file -storepass $SRVPASS -keypass $SRVPASS

ls -l
        # This will create a cert-file and this is the signing request we now need to send to the CA
        # So, that CA is able to sign our certificate

# 4. Get signed version of certificate file
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file -out cert-signed -days 365 -CAcreateserial -passin pass:$SRVPASS

ls -l
        # This will input the file "cert-file" and give output "cert-signed" as signed certificate file.

keytool -printcert -v -file cert-signed
        # Check signned "cert-signed" file content

# 5. Creating Trust store, Import our own ca-cert (public certificate key)
keytool -keystore kafka.server.truststore.jks -alias CARoot -import -file ca-cert -storepass $SRVPASS -keypass $SRVPASS -noprompt
        # Kafka broker at the end trusting all certificates which has been issued by our CA
        # This will add certificate to our key store
        # This will create "kafka.server.truststore.jks" (jks means java key store)

# 6. Import new certificates to our Key Store
keytool -keystore kafka.server.keystore.jks -alias CARoot -import -file ca-cert -storepass $SRVPASS -keypass $SRVPASS -noprompt

keytool -keystore kafka.server.keystore.jks -import -file cert-signed -storepass $SRVPASS -keypass $SRVPASS -noprompt

        #Intially we have created our server certificate which has been put in the kafka.server.key.jks
        #Now, we have signed verison of it and now we need to import this sign certificate to our key store
        # In addtion our CA certificate itself
        # Both file will be stored in our key store
        
# 7. Now, Configure Kafka Broker with below configuration - Save and restart kafka

listeners=PLAINTEXT://0.0.0.0:9092,SSL://0.0.0.0:9093
advertised.listeners=PLAINTEXT://ec2-3-64-213-181.eu-central-1.compute.amazonaws.com:9092,SSL://ec2-3-64-213-181.eu-central-1.compute.amazonaws.com:9093
zookeeper.connect=ec2-3-64-213-181.eu-central-1.compute.amazonaws.com:2181

ssl.keystore.location=/home/ubuntu/ssl/kafka.server.keystore.jks
ssl.keystore.password=serversecret
ssl.key.password=serversecret
ssl.truststore.location=/home/ubuntu/ssl/kafka.server.truststore.jks
ssl.truststore.password=serversecret

# 8. Confirm changes by checking end point of kafka server.log
sudo grep "EndPoint" /home/ubuntu/kafka/logs/server.log
        #We will see endpoint 9092 and 9093 port in logs

# 9. Allow port 9093 in EC2 Intance security group

# 10. Verify if we can reach our kafka broker with our new SSL Port (Local or another machine)
openssl s_client -connect ec2-3-64-213-181.eu-central-1.compute.amazonaws.com:9093

