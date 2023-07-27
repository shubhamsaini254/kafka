# 1.Creating a Certificate Authority (CA)

# ssh into Machine

cd /home/ubuntu
mkdir ssl
cd ssl
openssl req -new -newkey rsa:4096 -days 365 -x509 -subj "/CN=Kafka-Security-CA" -keyout ca-key -out ca-cert -nodes

# Two Files generated ca-cert is Public key and ca-key is Private key

# Private key file ca-key will not be sharebale make it private. When we open the file then we can see

cat ca-key

cat ca-cert

