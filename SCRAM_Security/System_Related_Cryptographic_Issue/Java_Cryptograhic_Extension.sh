# Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files 8 Download
# This is JCE Framework
# Original URL - https://www.oracle.com/in/java/technologies/javase-jce8-downloads.html

# Stop zookeeper and kafka servers first and follow below steps

# 1. Visit and Download JCE For Java 8 on all system or check this directory for this file
https://www.oracle.com/in/java/technologies/javase-jce8-downloads.html
or
wget https://github.com/alamimran613/kafka/raw/main/SCRAM_Security/System_Related_Cryptographic_Issue/jce_policy-8.zip

# 2. Unzip the file
unzip  unzip jce_policy-8.zip

# 3. Move US_export_policy.jar and local_policy.jar Files in java home
cd cd UnlimitedJCEPolicyJDK8/
sudo mv *.jar /lib/jvm/java-8-openjdk-amd64/jre/lib/security/

ls /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/

# 4. Restart your applications for affect the new policy. If you are using any application who use java. Or configure SSL for zookeeper and kafka then start your cluster

