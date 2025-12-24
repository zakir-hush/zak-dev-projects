resource "aws_vpc" "nat_vpc" {
  cidr_block           = "10.47.0.0/21"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "NAT-VPC"
    Environment = "SBX"
  }
}

# Associate secondary CIDR block
resource "aws_vpc_ipv4_cidr_block_association" "nat_vpc_secondary" {
  vpc_id     = aws_vpc.nat_vpc.id
  cidr_block = "100.64.0.0/16"
}