/** Region **/
data "aws_region" "current_region" {}

/** Availability Zones **/
data "aws_availability_zones" "available_az" {
  state = "available"
}

/*** VPC ***/
resource "aws_vpc" "vpc_01" {
  cidr_block           = var.vpc_01_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name        = local.vpc_01_name
    Environment = var.environment
    Region      = data.aws_region.current_region.name
    Terraform   = "true"
  }
}

/*** Subnets ***/
resource "aws_subnet" "vpc_01_public_subnets" {
  for_each          = var.vpc_01_public_subnets
  vpc_id            = aws_vpc.vpc_01.id
  cidr_block        = cidrsubnet(var.vpc_01_cidr_block, 8, each.value)
  availability_zone = tolist(data.aws_availability_zones.available_az.names)[each.value]

  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-${each.key}"
    Terraform = "true"
  }
}

resource "aws_subnet" "vpc_01_private_subnets" {
  for_each          = var.vpc_01_private_subnets
  vpc_id            = aws_vpc.vpc_01.id
  cidr_block        = cidrsubnet(var.vpc_01_cidr_block, 8, each.value)
  availability_zone = tolist(data.aws_availability_zones.available_az.names)[each.value - 100]

  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-${each.key}"
    Terraform = "true"
  }
}
