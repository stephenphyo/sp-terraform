resource "aws_vpc" "vpc_01" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name : "vpc-01",
    Version : 1
  }
}

output "vpc_id" {
  value = aws_vpc.vpc_01.id
}
