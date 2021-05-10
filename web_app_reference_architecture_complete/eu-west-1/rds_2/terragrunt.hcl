terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-rds.git?ref=v3.0.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../my-vpc", "../rds-sg"]
}

dependency "my-vpc" {
  config_path = "../my-vpc"
}

dependency "rds-sg" {
  config_path = "../rds-sg"
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/3.0.0?tab=inputs
###########################################################
inputs = {
  # The allocated storage in gigabytes
  # type: string
  allocated_storage = "5"

  # The days to retain backups for
  # type: number
  backup_retention_period = 0

  # The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window
  # type: string
  backup_window = ""

  # Whether to create a database subnet group
  # type: bool
  create_db_subnet_group = false

  # Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC
  # type: string
  db_subnet_group_name = dependency.my-vpc.outputs.database_subnet_group

  # The database engine to use
  # type: string
  engine = "mysql"

  # The engine version to use
  # type: string
  engine_version = "8.0.20"

  # The family of the DB parameter group
  # type: string
  family = "mysql8.0"

  # The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier
  # type: string
  identifier = "super-leech"

  # The instance type of the RDS instance
  # type: string
  instance_class = "db.m4.large"

  # The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'
  # type: string
  maintenance_window = ""

  # Specifies the major version of the engine that this option group should be associated with
  # type: string
  major_engine_version = "8.0"

  # Specifies if the RDS instance is multi-AZ
  # type: bool
  multi_az = false

  # Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file
  # type: string
  password = "s3wEazt5tnw7"

  # The port on which the DB accepts connections
  # type: string
  port = "3306"

  # Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier
  # type: bool
  skip_final_snapshot = true

  # Username for the master DB user
  # type: string
  username = "panda"

  # List of VPC security groups to associate
  # type: list(string)
  vpc_security_group_ids = [dependency.rds-sg.outputs.security_group_id]


}
