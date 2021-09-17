#!/bin/sh
GIT_USER=$1
GIT_EMAIL=$2

ansible-pull -U https://github.com/bartdorsey/developer-playbook.git -C multipass-test -e git_user="$GIT_USER" -e git_email="$GIT_EMAIL" playbook.yml
