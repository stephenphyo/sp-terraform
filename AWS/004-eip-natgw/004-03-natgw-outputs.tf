output "vpc_01_nat_gateway_eip_id" {
  description = "The allocation ID of the NAT Gateway EIP"
  value       = aws_eip.vpc_01_nat_gateway_eip.id
}

output "vpc_01_nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.vpc_01_nat_gateway.id
}
