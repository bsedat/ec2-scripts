ec2-hosts() {
  aws ec2 describe-instances --query "Reservations[*].Instances[*].[Tags[?Key=='Name'][Value]]" --output text
}

ec2-host() {
  local hostname="$1"
  if [ -z "$hostname" ]; then
    echo "Please specify a Name"
    return
  fi

  aws ec2 describe-instances --filters "Name=tag:Name,Values=$hostname" --query "Reservations[*].Instances[*].[PublicDnsName]" --output text
}
