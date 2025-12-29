resource "aws_route_table" "datacenter_vpc_rt" {
  vpc_id = aws_vpc.datacenter_vpc.id

  tags = {
    Name = "main-dc-vpc-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.datacenter_vpc_igw.id
  }
}


resource "aws_main_route_table_association" "datacenter_main" {
  vpc_id         = aws_vpc.datacenter_vpc.id
  route_table_id = aws_route_table.datacenter_vpc_rt.id
}


