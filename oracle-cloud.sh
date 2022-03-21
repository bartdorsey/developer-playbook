#!/bin/sh
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
ansible-galaxy collection install community.postgresql community.general
ansible-pull -U https://github.com/fullstackacademy/developer-playbook.git playbook.yml
echo ""
echo "Ansible setup complete, rebooting server...."
echo ""
sleep 10
sudo reboot
