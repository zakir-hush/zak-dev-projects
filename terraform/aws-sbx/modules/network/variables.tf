variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "az" {
  description = "Availability Zone for the subnets"
  type        = string
}

variable "subnet_configs" {
  description = "Map of subnet names to CIDRs"
  type        = map(string)
}
