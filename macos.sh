#!/bin/sh
brew update
brew install ansible
ansible-galaxy collection install community.postgresql community.general
ansible-pull -K -U https://github.com/fullstackacademy/developer-playbook.git playbook.yml
echo "Ansible setup complete, close your Terminal and open a new one..."

