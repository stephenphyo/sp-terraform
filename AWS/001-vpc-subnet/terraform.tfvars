environment = "dev"
app         = "app"

vpc_01_name       = "vpc-01"
vpc_01_cidr_block = "10.1.0.0/16"

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
