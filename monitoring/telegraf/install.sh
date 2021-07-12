curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
DISTRIB_ID=$(lsb_release -c -s)
echo "deb https://repos.influxdata.com/debian ${DISTRIB_ID} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt update
sudo apt install telegraf
sudo usermod -aG docker telegraf
sudo usermod -aG video telegraf
sudo setcap 'cap_net_admin,cap_net_raw+ep' $(which ping)
# edit telegraf.conf
sudo systemctl restart telegraf
