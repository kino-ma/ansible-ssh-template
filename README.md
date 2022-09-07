# ansible-ssh-template

Template project to run ansible that uses SSH.

## dependency

- Docker

## usage

### 1. Clone this repository to your local computer

If you use Git in your project, remove `.git` in this directory.

### 2. Edit `hosts.yml`

`hosts.yml` will contain information about hosts to apply your ansible tasks.

### 3. Edit `main.yml`

`main.yml` will manage which hosts to run tasks.

### 4. Edit `roles/`

- `roles/<role-name>/`: contains information about hosts with the role `role-name`.
  - `tasks/`: contains task to be run for the hosts
  - `vars/`: contains variables that can be accesible in tasks and so on
  - `templates/`: contains template files to be referred in tasks

### 5. Edit `group_vars/all/credential.yml`

You can store sensitive information like remote login password in `group_vars/all/credential.yml`. This file will be encrypted later.

### 6. Run

`make run` will automatically:

- Generate a SSH key pair (ED25519)
  - You can use this key pair to ssh to your host
- Encrypt `group_vars/all/credential.yml`
  - You will be asked a password to encrypt/decrypt
- Run `ansible-playbook` using the contents of `main.yml`

### 7. Custom the configurations as you like

You can customize the host/role/task configuration files as you would like to use in your project.