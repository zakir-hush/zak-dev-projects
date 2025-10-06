provider "aws" {
  region = "ap-southeast-2"
}

data "aws_vpc" "sandbox" {
  filter {
    name   = "tag:Name"
    values = ["sandbox-vpc"] // Change this to match VPC tag
  }
}

module "az2_subnets" {
  source   = "./modules/network"
  vpc_id   = vpc-03696a9c24405bca5
  az       = "ap-southeast-2c"  // AZ2

  subnet_configs = {
    "sandbox-fw-az2-mgt-subnet" = "10.49.30.0/24"
    "sandbox-fw-az2-ew-subnet" = "10.49.31.0/24"
    "sandbox-fw-az2-sn-subnet" = "10.49.32.0/24"
  }
}
