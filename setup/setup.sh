CURRENT_HOSTNAME=`cat /etc/hostname | tr -d " \t\n\r"`
read -p 'Hostname: ' NEW_HOSTNAME
read -p 'New password for pi user: ' -s PI_PASSWORD
read -p 'Your username: ' MY_USER
read -p 'Your password: ' -s MY_PASSWORD

# Change default password
echo -e "raspberry\n${PI_PASSWORD}\n${PI_PASSWORD}" | passwd
sudo apt update && sudo apt upgrade -y
sudo apt install -y ansible sshpass nano

# Add me
sudo useradd -p $(openssl passwd -1 ${MY_PASSWORD}) -m $MY_USER
sudo adduser $MY_USER sudo
echo "${MY_USER} ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/010_${MY_USER}-nopasswd

# Change hostname
echo $NEW_HOSTNAME | sudo tee /etc/hostname > /dev/null
sudo sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME\$/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts

# Required for ElasticSearch
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf > /dev/null

sudo reboot