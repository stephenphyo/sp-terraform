environment = "dev"
app         = "app"

/* VPC */
vpc_01_name       = "vpc-01"
vpc_01_cidr_block = "10.1.0.0/16"

/* Subnets */
vpc_01_public_subnets = {
  "public-subnet-01" = 1,
  "public-subnet-02" = 2,
  "public-subnet-03" = 3
}

vpc_01_private_subnets = {
  "private-subnet-01" = 101,
  "private-subnet-02" = 102,
  "private-subnet-03" = 103
}

/* Route Tables */
vpc_01_public_route_table_cidr_block  = "0.0.0.0/0"
vpc_01_private_route_table_cidr_block = "0.0.0.0/0"

/* Security Groups */
vpc_01_sg_01_name = "web-sg"
vpc_01_sg_01_ingress_rules = [
  {
    from_port = 80
    to_port   = 80
  },
  {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
  }
]
