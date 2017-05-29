#!/bin/bash

hostname="$1"
if [ -z "$hostname" ]; then
  echo "Please specify a Name"
  return 1
fi

aws ec2 describe-instances --filters "Name=tag:Name,Values=$hostname" --query "Reservations[*].Instances[*].[PublicDnsName]" --output text
