/*** Route Tables ***/
resource "aws_route_table" "vpc_01_public_route_table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = var.vpc_01_public_route_table_cidr_block
    gateway_id = aws_internet_gateway.vpc_01_igw.id
  }

  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-public-route-table"
    Terraform = "true"
  }
}

resource "aws_route_table" "vpc_01_private_route_table" {
  vpc_id = aws_vpc.vpc_01.id

  # route {
  #   cidr_block     = var.vpc_01_private_route_table_cidr_block
  #   nat_gateway_id = aws_nat_gateway.vpc_01_nat_gateway.id
  # }

  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-private-route-table"
    Terraform = "true"
  }
}

/*** Route Table Associations ***/
resource "aws_route_table_association" "vpc_01_public_route_table_association" {
  depends_on     = [aws_subnet.vpc_01_public_subnets]
  route_table_id = aws_route_table.vpc_01_public_route_table.id
  for_each       = aws_subnet.vpc_01_public_subnets
  subnet_id      = each.value.id
}

resource "aws_route_table_association" "vpc_01_private_route_table_association" {
  depends_on     = [aws_subnet.vpc_01_private_subnets]
  route_table_id = aws_route_table.vpc_01_private_route_table.id
  for_each       = aws_subnet.vpc_01_private_subnets
  subnet_id      = each.value.id
}
