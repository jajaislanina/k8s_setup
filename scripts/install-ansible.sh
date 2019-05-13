#!/usr/bin/env bash

set -e

echo '**Installing Ansible**'
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y --allow-unauthenticated
cp /vagrant/scripts/ansible.cfg /etc/ansible/ansible.cfg
