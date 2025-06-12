# liberamos la ip 
sudo dhclient -r

# pedimos una nueva IP añ DHCP
sudo dhclient

# saber mi ip publica
wget -qO- ifconfig.me/ip
