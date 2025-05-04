resource "aws_security_group" "vpc_01_sg_01" {
  name   = var.vpc_01_sg_01_name
  vpc_id = aws_vpc.vpc_01.id

  ingress {
    description = "Microsoft SQL"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.vpc_01_sg_01_ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  /* Allow All Egress Traffic */
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true # To avoid DependencyViolation Timeout
  }

  tags = {
    "Name" = var.vpc_01_sg_01_name
  }
}
