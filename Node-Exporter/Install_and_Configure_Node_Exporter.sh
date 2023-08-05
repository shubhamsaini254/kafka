# Go to home directory
cd
# Download Node exorter binary file
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
# Extract binary file
tar -xvf node_exporter-1.6.1.linux-amd64.tar.gz
# Remove Binary file
rm -r node_exporter-1.6.1.linux-amd64.tar.gz
# Create soft link for binary file's directory
ln -s node_exporter-1.6.1.linux-amd64/ node-exporter
# Create systemd file for node exporter
sudo nano /etc/systemd/system/node-exporter.service

# Test and get metrics on local system
curl localhost:9100/metrics
