#!/bin/bash

## VARIABLES
# Path of current script directory
PARENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
# Path of root Git directory - assuming it's one level above current script directory
HOME_DIR="$(dirname "$PARENT_DIR")"
# Path of ansible inventory file
ANSIBLE_DIR="$HOME_DIR/ansible_inventory"
# Path of default ansible directory
ANSIBLE_DEFAULT_DIR="/etc/ansible/hosts"
# GUID
GUID=`hostname|awk -F. '{print $2}'`

echo "Copying inventory file to /etc/ansible/hosts..."
cp $ANSIBLE_DIR $ANSIBLE_DEFAULT_DIR

echo "Setting GUID in inventory file..."
sed -i "s/GUID/$GUID/g" $ANSIBLE_DEFAULT_DIR