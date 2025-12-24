# resource <resource-type> <resource-name>
resource "aws_vpc" "datacenter_vpc" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "Datacenter-vpc"
    Environment = "LAB"
  }
}

