#!/bin/bash
INSTANCE_NAME="stockhunter-webserver"
INSTANCE_IDS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$INSTANCE_NAME" --query "Reservations[].Instances[].InstanceId" --output text)
IP_ADDRESSES=""
for INSTANCE_ID in $INSTANCE_IDS; do
    # Get the public IP address of the instance
    PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[].Instances[].PublicIpAddress" --output text)
    # Append the public IP address to the list
    IP_ADDRESSES="$IP_ADDRESSES $PUBLIC_IP"
done
# Append the IP addresses to the Ansible inventory file
echo "[webservers]" >> .circleci/ansible/inventory.txt
echo "$IP_ADDRESSES" | tr ' ' '\n' >> .circleci/ansible/inventory.txt

  

