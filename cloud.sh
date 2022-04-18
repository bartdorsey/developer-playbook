#!/bin/sh
echo "Enter your sudo password:"
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
curl -o /tmp/requirements.yml https://raw.githubusercontent.com/bartdorsey/developer-playbook/main/requirements.yml
ansible-galaxy install -r /tmp/requirements.yml
rm /tmp/requirements.yml
ansible-pull -U https://github.com/bartdorsey/developer-playbook.git playbook.yml
echo ""
echo "Ansible setup complete, rebooting server...."
echo ""
sleep 10
sudo reboot
