# Custom Ansible Playbook for Ubuntu on WSL2

## How to use this

1. Install WSL2.
2. Install Ubuntu
3. Install Ansible on Ubuntu
    
    ```shell
    sudo apt update
    sudo apt install ansible
    ```
4. Clone this repo down or download the zip file.
5. Optionally change the postgres password the variables.yml file
6. Run the playbook from the directory

    ```shell
    ansible-playbook -K main.yml
    ```

This installs the following things:

- zsh
- acl
- git
- postgresql
- pip for python
- the [starship prompt](https://starship.rs)
- nvm
- Node.JS LTS
- eslint
- Generates an ssh key, it will be in ~/.ssh/id_rsa.pub
- termdown (A pip module that gives you a countdown)

Feel free to fork this and modify it to suit your needs or learn a bit about
how to fight with ansible.

