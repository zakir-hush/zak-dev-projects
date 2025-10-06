provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "sandbox" {
  filter {
    name   = "tag:Name"
    values = ["sandbox-vpc"] # Change this to match your VPC tag
  }
}

module "az3_subnets" {
  source   = "./modules/network"
  vpc_id   = data.aws_vpc.sandbox.id
  az       = "us-east-1c"  # Your AZ3

  subnet_configs = {
    "sandbox-az3-public-subnet"     = "10.0.30.0/24"
    "sandbox-az3-private-subnet"    = "10.0.31.0/24"
    "sandbox-az3-inspection-subnet" = "10.0.32.0/24"
  }
}
