#!/bin/sh

get_username() {
  echo "Enter your git username"
  read GIT_USER
  if [ -z GIT_USER ]; then
     get_username
  fi
}

get_email() {
  echo "Enter your git email"
  read GIT_EMAIL
  if [ -z GIT_EMAIL ]; then
     get_email
  fi
}

get_username
get_email

ansible-pull -U https://github.com/bartdorsey/developer-playbook.git -C multipass-test -e git_user="$GIT_USER" -e git_email="$GIT_EMAIL" playbook.yml