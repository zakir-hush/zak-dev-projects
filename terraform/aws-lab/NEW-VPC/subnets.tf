resource "aws_subnet" "dc_private1_az1" {
  vpc_id            = aws_vpc.datacenter_vpc.id
  cidr_block        = "10.100.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-private1-az1-Datacenter-vpc"
  }
}

resource "aws_subnet" "dc_public1_az1" {
  vpc_id            = aws_vpc.datacenter_vpc.id
  cidr_block        = "10.100.64.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-public1-az1-Datacenter-vpc"
  }
}

resource "aws_subnet" "dc_tgw_attachment_az1" {
  vpc_id            = aws_vpc.datacenter_vpc.id
  cidr_block        = "10.100.96.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tgw-attachment-az1-Datacenter-vpc"
  }
}

# AZ2 us-east-1b

resource "aws_subnet" "dc_private1_az2" {
  vpc_id            = aws_vpc.datacenter_vpc.id
  cidr_block        = "10.100.128.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-private1-az2-Datacenter-vpc"
  }
}


resource "aws_subnet" "dc_public1_az2" {
  vpc_id            = aws_vpc.datacenter_vpc.id
  cidr_block        = "10.100.192.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-public1-az2-Datacenter-vpc"
  }
}


resource "aws_subnet" "dc_tgw_attachment_az2" {
  vpc_id            = aws_vpc.datacenter_vpc.id
  cidr_block        = "10.100.224.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tgw-attachment-az2-Datacenter-vpc"
  }
}
