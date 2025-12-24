output "vpc_id" {
  value = aws_vpc.datacenter_vpc.id
}

output "private_subnets" {
  value = {
    az1 = aws_subnet.dc_private1_az1.id
    az2 = aws_subnet.dc_private1_az2.id
  }
}

output "public_subnets" {
  value = {
    az1 = aws_subnet.dc_public1_az1.id
    az2 = aws_subnet.dc_public1_az2.id
  }
}

output "tgw_subnets" {
  value = {
    az1 = aws_subnet.dc_tgw_attachment_az1.id
    az2 = aws_subnet.dc_tgw_attachment_az2.id
  }
}

