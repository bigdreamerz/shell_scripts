#!/bin/bash

#Author: Madhan D
#Purpose: This scripts helps to find the current ec2 running in the AWS console.
#Date:10:06:2024
#Version:1.0

set -x

instanceids=$(aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId')

for InstanceId in $instanceids; do

aws ec2 describe-instances --instance-ids "$InstanceId" | jq '.Reservations[].Instances[] | {InstanceId: .InstanceId, InstanceType: .InstanceType, KeyName: .KeyName, PublicDnsName: .PublicDnsName}'

done
