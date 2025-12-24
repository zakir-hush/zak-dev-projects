resource "aws_ec2_transit_gateway" "datacenter_tgw" {
  description = "TGW for Datacenter VPC"
  amazon_side_asn = 64512

  tags = {
    Name = "Datacenter-TGW"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "datacenter_tgw_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.datacenter_tgw.id
  vpc_id             = aws_vpc.datacenter_vpc.id
  subnet_ids         = [
    aws_subnet.dc_tgw_attachment_az1.id,
    aws_subnet.dc_tgw_attachment_az2.id
  ]

  tags = {
    Name = "Datacenter-TGW-Attachment"
  }
}
