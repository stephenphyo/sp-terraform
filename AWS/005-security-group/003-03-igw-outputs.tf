output "vpc_01_internet_gateway_id" {
  description = "The ID of Internet Gateway"
  value       = aws_internet_gateway.vpc_01_igw.id
}
