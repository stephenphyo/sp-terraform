/*** EIP Allocation ***/
resource "aws_eip" "vpc_01_nat_gateway_eip" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.vpc_01_igw]

  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-nat-gateway-eip"
    Terraform = "true"
  }
}

/*** NAT Gateway ***/
resource "aws_nat_gateway" "vpc_01_nat_gateway" {
  depends_on    = [aws_subnet.vpc_01_public_subnets]
  subnet_id     = aws_subnet.vpc_01_public_subnets["public-subnet-01"].id
  allocation_id = aws_eip.vpc_01_nat_gateway_eip.id

  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-nat-gateway"
    Terraform = "true"
  }
}
