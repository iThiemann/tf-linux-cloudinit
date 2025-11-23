#cloud-config
# This is a placeholder cloud-init configuration.
# In a real VM/cloud environment, cloud-init would consume this.
# Here we just render it and pass it into the container as an env var
# (CLOUD_INIT_CONFIG_BASE64), so you can later add an entrypoint that uses it.

hostname: ${hostname}
manage_etc_hosts: true

users:
  - name: devuser
    gecos: "Dev User"
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    shell: /bin/bash
    lock_passwd: true
    ssh_authorized_keys:
      - "ssh-rsa  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII1eaoRPxvXyhAKA1LWgC7ukKZmLpkRUKZjWeA0zq34H" 

packages:
  - curl
  - vim
  - git

runcmd:
  - [ bash, -c, "echo 'Cloud-init placeholder executed' > /var/log/cloud-init-placeholder.log" ]

