#!/bin/bash

if [ -z "$DIGITALOCEAN_TOKEN" ] ; then
    echo "DIGITALOCEAN_TOKEN is required"
    exit 1
fi

ansible-playbook -i /dev/null step1.yml
