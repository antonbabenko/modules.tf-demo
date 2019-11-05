terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-autoscaling.git?ref=v3.1.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../aws-data", "../vpc", "../security-group_2"]
}

dependency "aws-data" {
  config_path = "../aws-data"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "security-group_2" {
  config_path = "../security-group_2"
}

inputs = {
  # The number of Amazon EC2 instances that should be running in the group
  # type: string
  desired_capacity = "0"

  # Controls how health checking is done. Values are - EC2 and ELB
  # type: string
  health_check_type = "EC2"

  # The EC2 image ID to launch
  # type: string
  image_id = dependency.aws-data.outputs.amazon_linux2_aws_ami_id

  # The size of instance to launch
  # type: string
  instance_type = "m4.large"

  # The maximum size of the auto scale group
  # type: string
  max_size = "0"

  # The minimum size of the auto scale group
  # type: string
  min_size = "0"

  # Creates a unique name beginning with the specified prefix
  # type: string
  name = "able-foal"

  # A list of security group IDs to assign to the launch configuration
  # type: list(string)
  security_groups = [dependency.security-group_2.outputs.this_security_group_id]

  # A list of subnet IDs to launch resources in
  # type: list(string)
  vpc_zone_identifier = dependency.vpc.outputs.public_subnets

  
}
