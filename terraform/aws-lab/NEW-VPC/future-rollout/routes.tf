resource "aws_route_table" "nat_vpc_rt" {
  vpc_id = aws_vpc.nat_vpc.id

  tags = {
    Name = "nat-vpc-rt"
  }
}

resource "aws_route_table_association" "outside_client_assoc" {
  subnet_id      = aws_subnet.outside_client.id
  route_table_id = aws_route_table.nat_vpc_rt.id
}

resource "aws_route_table_association" "outside_ausiex_assoc" {
  subnet_id      = aws_subnet.outside_ausiex.id
  route_table_id = aws_route_table.nat_vpc_rt.id
}

resource "aws_route_table_association" "tgw_assoc" {
  subnet_id      = aws_subnet.tgw_attachment.id
  route_table_id = aws_route_table.nat_vpc_rt.id
}

# Replace <tgw-id> when available
resource "aws_route" "default_to_tgw" {
  route_table_id         = aws_route_table.nat_vpc_rt.id
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = "<tgw-id>"
}
