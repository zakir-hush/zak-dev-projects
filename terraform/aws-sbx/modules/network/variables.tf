variable "vpc_id" {
  description = "vpc-03696a9c24405bca5"
  type        = string
}

variable "az" {
  description = "ap-southeast-2c"
  type        = string
}

variable "subnet_configs" {
  description = "Map of subnet names to CIDRs"
  type        = map(string)
}
