# Custom Ansible Playbook for Ubuntu on WSL2 and macOS

This is a custom ansible playbook. It sets up all the tools for local web
development using Node.JS

## How to use this

### Windows

1. Install WSL2.
2. Install Ubuntu (20.04 LTS recommended)
3. Run the playbook

    ```shell
    curl https://raw.githubusercontent.com/bartdorsey/developer-playbook/main/wsl.sh | sh
    ```

## MacOS

1. Install Homebrew
2. Run the playbook

    ```shell
    curl https://raw.githubusercontent.com/bartdorsey/developer-playbook/main/macos.sh | sh
    ```

## Ubuntu

1. Run the playbook

    ```shell
    curl https://raw.githubusercontent.com/bartdorsey/developer-playbook/main/ubuntu.sh | sh
    ```

## Cloud Ubuntu (any cloud ubuntu where you don't have to put in a password)

1. Run the playbook

    ```shell
    curl https://raw.githubusercontent.com/bartdorsey/developer-playbook/main/cloud.sh | sh
    ```

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
