#!/bin/sh
echo "Enter your sudo password:"
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
ansible-galaxy collection install community.postgresql community.general
echo ""
echo "Enter your sudo password again when prompted by BECOMES:"
echo ""
ansible-pull -K -U https://github.com/fullstackacademy/developer-playbook.git playbook.yml
echo ""
echo "Ansible setup complete, please close your Ubuntu Terminal and open a new one."
