#!/bin/bash
read -p "Do you want to add Shecan DNS to your system? (y/n): " CONFIRM
if [[ $CONFIRM == 'y' ]]; then
          cp /etc/resolv.conf /etc/resolv.conf.bak
	        echo "nameserver 178.22.122.100" > /etc/resolv.conf
fi

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

if [[ $CONFIRM == 'y' ]]; then
          echo -e '------------------------------------------------------\n------------------------------------------------------'
          read -p "Do you want to REMOVE Shecan DNS from your system? (y/n): " REMOVE_CONFIRM
          if [[ $REMOVE_CONFIRM == 'y' ]]; then
                    sleep 2
                    cp /etc/resolv.conf.bak /etc/resolv.conf
          fi
fi




