#!/bin/bash

if [ ! -f group_vars/all/consul_encrypt_key.yml ] ; then
    key=$(dd if=/dev/urandom bs=16 count=1 | base64)
    echo "consul_encrypt_key: $key" > group_vars/all/consul_encrypt_key.yml
fi

if [ ! -f group_vars/all/nomad_encrypt_key.yml ] ; then
    key=$(dd if=/dev/urandom bs=16 count=1 | base64)
    echo "nomad_encrypt_key: $key" > group_vars/all/nomad_encrypt_key.yml
fi

export TF_STATE=../terraform/terraform.tfstate
ansible-playbook -i ../terraform-inventory -u centos --private-key=../id_rsa step2.yml
