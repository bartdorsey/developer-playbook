# Custom Ansible Playbook for Ubuntu on WSL2 and macOS

This is a custom ansible playbook. It sets up all the tools for local web
development using Node.JS

## How to use this

### Windows

1. Install WSL2.
2. Install Ubuntu (20.04 LTS recommended)
3. Install Ansible on Ubuntu

    ```shell
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
    ```

4. Clone this repo down or download the zip file.
5. Run the playbook from the directory

    ```shell
    ansible-playbook -K playbook.yml
    ```

6. Enter your password when prompted.

## MacOS

1. Install ansible

    With Homebrew

    ```shell
    brew install ansible
    ```

    or with python3

    ```shell
    pip3 install ansible
    ```

2. Clone this repo down or download the zip file
3. Run the playbook from the directory

   ```shell
   ansible-playbook -K playbook.yml
   ```

4. Enter your password when prompted.

This installs the following things:

- zsh (WSL Only)
- acl (WSL Only)
- git (WSL Only)
- postgresql
- pip for python (WSL Only)
- the [starship prompt](https://starship.rs)
- nvm
- Node.JS LTS
- ngrok (installs in ~/.local/bin)
- eslint
- The heroku command line
- Generates an ssh key, it will be in ~/.ssh/id_ed25519.pub
- Sets VSCODE to be your default editor.
- Configures git username, email and sets `git pull` to do a rebase
- Sets up an `open` and `wsl` alias (WSL Only)

Feel free to fork this and modify it to suit your needs or learn a bit about
how to fight with ansible.
