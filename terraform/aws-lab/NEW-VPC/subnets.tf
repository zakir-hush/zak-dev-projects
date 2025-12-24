resource "aws_subnet" "outside_client" {
  vpc_id            = aws_vpc.nat_vpc.id
  cidr_block        = "100.64.1.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "outside-client-nat-vpc"
  }
}

resource "aws_subnet" "outside_ausiex" {
  vpc_id            = aws_vpc.nat_vpc.id
  cidr_block        = "100.64.2.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "outside-ausiex-nat-vpc"
  }
}

resource "aws_subnet" "tgw_attachment" {
  vpc_id            = aws_vpc.nat_vpc.id
  cidr_block        = "10.47.0.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "tgw-attachment-nat-vpc"
  }
}
