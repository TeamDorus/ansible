#!/bin/bash

docker exec -u semaphore sem-test_semaphore_1 mkdir /tmp/semaphore/.ssh 
docker cp ~/.ssh/id_rsa sem-test_semaphore_1:/tmp/semaphore/.ssh/id_rsa
docker exec -u root sem-test_semaphore_1 chown semaphore:root /tmp/semaphore/.ssh/id_rsa

docker cp ~/ansible/vars/secrets.yml sem-test_semaphore_1:/tmp/semaphore/.ansible/secrets.yml
docker exec -u root sem-test_semaphore_1 chown semaphore:root /tmp/semaphore/.ansible/secrets.yml

docker exec -u semaphore sem-test_semaphore_1 mkdir /tmp/semaphore/plays


# Repositories: 
#   github Team Dorus
#   local ./plays

# Inventories: 
#   github netbox script: "inventory_netbox.yml"
#   local type static test inventory

# Environment: secrets locations
#   {
#     "secrets_dir" : "/tmp/semaphore/.ansible",
#     "local_cert_dir" : "/tmp/semaphore/certificates"
#   }

# Key store
#   Become: type: login / password for sudo
#   Eric's key: type ssh / mijn private key
#   Secrets Vault: type login / passwordt voor ansible-vault


