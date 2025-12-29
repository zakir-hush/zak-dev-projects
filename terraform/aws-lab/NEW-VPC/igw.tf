resource "aws_internet_gateway" "datacenter_vpc_igw" {
  vpc_id = aws_vpc.datacenter_vpc.id

  tags = {
    Name = "datacenter-vpc-igw"
  }
}
