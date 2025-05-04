/*** Internet Gateway ***/
resource "aws_internet_gateway" "vpc_01_igw" {
  vpc_id = aws_vpc.vpc_01.id
  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-internet-gateway"
    Terraform = "true"
  }
}
