#!/bin/bash

# Set the name tag value for the instances
INSTANCE_NAME="stockhunter-webserver"

# Get instance IDs with the specified name tag
INSTANCE_IDS=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$INSTANCE_NAME" --query "Reservations[].Instances[].InstanceId" --output text)

# Initialize a variable to store IP addresses
IP_ADDRESSES=""

# Loop through each instance ID to get the public IP addresses
for INSTANCE_ID in $INSTANCE_IDS; do
    # Get the public IP address of the instance
    PUBLIC_IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[].Instances[].PublicIpAddress" --output text)
    # Append the public IP address to the list
    IP_ADDRESSES="$IP_ADDRESSES $PUBLIC_IP"
done

# Append the IP addresses to the Ansible inventory file
echo "[group_name]" >> inventory.txt
echo "$IP_ADDRESSES" | tr ' ' '\n' >> inventory.txt

