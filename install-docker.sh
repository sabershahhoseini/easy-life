#!/bin/bash
read -p "Do you want to add Shecan DNS to your system? (y/n): " CONFIRM
if [[ $CONFIRM == 'y' ]]; then
          cp /etc/resolv.conf /etc/resolv.conf.bak
	        echo "nameserver 178.22.122.100" > /etc/resolv.conf
fi
apt update && apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt install docker-ce -y
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

if [[ $CONFIRM == 'y' ]]; then
          echo -e '------------------------------------------------------\n------------------------------------------------------'
          read -p "Do you want to REMOVE Shecan DNS from your system? (y/n): " REMOVE_CONFIRM
          if [[ $REMOVE_CONFIRM == 'y' ]]; then
                    sleep 2
                    cp /etc/resolv.conf.bak /etc/resolv.conf
          fi
fi
