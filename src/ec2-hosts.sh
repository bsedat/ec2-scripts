#!/bin/bash

aws ec2 describe-instances --query "Reservations[*].Instances[*].[Tags[?Key=='Name'][Value]]" --output text
