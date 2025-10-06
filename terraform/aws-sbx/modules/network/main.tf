resource "aws_subnet" "this" {
  for_each = var.subnet_configs

  vpc_id                  = var.vpc_id
  cidr_block              = each.value
  availability_zone       = var.az
  map_public_ip_on_launch = false

  tags = {
    Name = each.key
    AZ   = var.az
  }
}
