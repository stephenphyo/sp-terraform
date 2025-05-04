output "vpc_01_public_route_table_id" {
  description = "The ID of the Public Route Table"
  value       = aws_route_table.vpc_01_public_route_table.id
}

output "vpc_01_private_route_table_id" {
  description = "The ID of the Private Route Table"
  value       = aws_route_table.vpc_01_private_route_table.id
}
