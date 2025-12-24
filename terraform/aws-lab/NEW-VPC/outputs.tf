output "vpc_id" {
  value = aws_vpc.nat_vpc.id
}

output "subnets" {
  value = {
    outside_client = aws_subnet.outside_client.id
    outside_ausiex = aws_subnet.outside_ausiex.id
    tgw_attachment = aws_subnet.tgw_attachment.id
  }
}
