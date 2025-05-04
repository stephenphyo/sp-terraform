variable "vpc_01_name" {
  description = "Name of VPC"
  type        = string
}

variable "vpc_01_cidr_block" {
  description = "CIDR Block of VPC"
  type        = string
}

variable "vpc_01_public_subnets" {
  description = "Map CIDR blocks of Public Subnets"
  type        = map(number)
}

variable "vpc_01_private_subnets" {
  description = "Map CIDR blocks of Private Subnets"
  type        = map(number)
}

locals {
  vpc_01_name = "${local.prefix}-${var.vpc_01_name}"
}
