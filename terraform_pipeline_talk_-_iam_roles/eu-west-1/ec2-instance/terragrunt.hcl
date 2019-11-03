terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v2.8.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  # ID of AMI to use for the instance
  # type: string
  ami = ""

  # The type of instance to start
  # type: string
  instance_type = "c3.large"

  # Name to be used on all resources as prefix
  # type: string
  name = "up-bird"

  # A list of security group IDs to associate with
  # type: list(string)
  vpc_security_group_ids = []

  
}
