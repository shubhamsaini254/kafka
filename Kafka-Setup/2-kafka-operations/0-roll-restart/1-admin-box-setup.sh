########
#### ADMIN MACHINE 
########

# We will setup https://github.com/Yelp/kafka-utils/tree/master

# Install Python Pip
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user

# necessary packages to compile kafka-utils
sudo yum -y install gcc openssl-devel 

# install kafka utils
pip install --user kafka-utils

# If above command didn't work then try this
pip3 install --user kafka-utils

# test command
kafka-utils --help

# configuration
sudo mkdir -p /etc/kafka_discovery
sudo nano /etc/kafka_discovery/kafka.yaml

# list all clusters
kafka-utils

# test command to see if brokers are detected:
kafka-rolling-restart --cluster-type kafka

#If found error with usrlib2.0 not compatible with openssl 1.0 or something like that then use below command

pip install urllib3==1.26.6

# fix SSH error
cd .ssh

# Disable Strict Host checking (we're in the cloud)
nano /home/ec2-user/.ssh/config

#Add below lines in config file remove # sign for working
# Host *
#    StrictHostKeyChecking no

sudo chmod 400 ~/.ssh/config

# generate public / private key for admin box
ssh-keygen
# view content of public key
cat id_rsa.pub 


########
#### KAFKA MACHINES
########
nano .ssh/authorized_keys
# edit the content of the admin id_rsa.pub

########
#### ADMIN MACHINE
########
ssh 172.31.32.31  # should work
exit

# rolling restart should work!
kafka-rolling-restart --cluster-type kafka
yes

# all options
kafka-rolling-restart --help

# to have the perfect command:
kafka-rolling-restart --cluster-type kafka --start-command "systemctl start kafka" --stop-command "systemctl stop kafka" --check-count 3
