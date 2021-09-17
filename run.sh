#!/bin/sh

get_username() {
  echo "Enter your git username"
  read GIT_USER
  if [ "$GIT_USER" = "" ]; then
     get_username
  fi
}

get_email() {
  echo "Enter your git email"
  read GIT_EMAIL
  if [ "$GIT_EMAIL" = "" ]; then
     get_email
  fi
}

verify_input() {
  echo "Your Username is $GIT_USER";
  echo "Your Email is $GIT_EMAIL";
  echo "Is this correct (Y/N)";
  read CORRECT
  if [ CORRECT -eq 'N' ]; then
    get_username
    get_password
    verify_input
  fi
}

get_username
get_email
verify_input

ansible-pull -U https://github.com/bartdorsey/developer-playbook.git -C multipass-test -e git_user="$GIT_USER" -e git_email="$GIT_EMAIL" playbook.yml