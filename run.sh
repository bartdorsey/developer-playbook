#!/bin/sh
ansible-galaxy collection install community.postgresql
ansible-galaxy collection install community.general
ansible-pull -U https://github.com/bartdorsey/developer-playbook.git -K playbook.yml
