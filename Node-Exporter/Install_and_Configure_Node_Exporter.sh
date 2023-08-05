cd
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar -xvf node_exporter-1.6.1.linux-amd64.tar.gz
rm -r node_exporter-1.6.1.linux-amd64.tar.gz
ln -s node_exporter-1.6.1.linux-amd64/ node-exporter
sudo nano /etc/systemd/system/node-exporter.service
