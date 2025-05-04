/*** VPC ***/
output "vpc_01_id" {
  description = "ID of VPC 01"
  value       = aws_vpc.vpc_01.id
  sensitive   = true
}

/*** Subnets ***/
output "vpc_01_public_subnet_ids" {
  description = "IDs of Public Subnets in VPC 01"
  value       = [for subnet in aws_subnet.vpc_01_public_subnets : subnet.id]
}

output "vpc_01_private_subnet_ids" {
  description = "IDs of Private Subnets in VPC 01"
  value       = [for subnet in aws_subnet.vpc_01_private_subnets : subnet.id]
}
