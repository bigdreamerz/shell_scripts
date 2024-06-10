#!/bin/bash

#Author: Madhan D
#Purpose: This scripts helps to find the current ec2 running in the AWS console.
#Date:10:06:2024
#Version:1.0

set -x

aws ec2 describe-instances | jq '.Reservations[].Instances[] | {InstanceId: .InstanceId, InstanceType: .InstanceType, KeyName: .KeyName, PublicDnsName: .PublicDnsName}'
