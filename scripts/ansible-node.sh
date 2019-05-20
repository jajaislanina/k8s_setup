#!/usr/bin/env bash

set -e

echo '**Running ansible playbook**'
ansible-playbook /vagrant/kubernetes-setup/k8s-node.yml

