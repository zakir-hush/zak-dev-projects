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

#output "tgw_id" {
#  value = aws_ec2_transit_gateway.datacenter_tgw.id
#}

#output "tgw_attachment_id" {
#  value = aws_ec2_transit_gateway_vpc_attachment.datacenter_tgw_attachment.id
#}

output "igw_id" {
  value = {
    aws_internet_gateway.datacenter_vpc_igw.id
  }
}

output "route_table" {
  value = {
    aws_route_table.datacenter_vpc_rt.id
  }
}

output "ec2" {
  value = {
    aws_instance.flask.id
  }
}