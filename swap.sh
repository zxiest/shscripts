# get and execute this script using the following
# wget --no-check-certificate - https://raw.github.com/zxiest/shscripts/master/swap.sh | bash
 
sudo dd if=/dev/zero of=/swapfile bs=1024 count=4096 # create 4 GB of swap
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" | sudo tee -a /etc/fstab
 
echo 10 | sudo tee /proc/sys/vm/swappiness
echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf
 
sudo chown root:root /swapfile
sudo chmod 0600 /swapfile
