resource "aws_vpc" "vpcs" {
  for_each             = var.vpc
  cidr_block           = each.value
  enable_dns_hostnames = true

  tags = {
    Name : each.key,
  }
}

output "vpcs_id" {
  value = [for vpc in aws_vpc.vpcs : vpc.id]
}
