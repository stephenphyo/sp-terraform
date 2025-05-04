module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.8.0"
}

output "s3_bucket_name" {
  value = module.s3-bucket.s3_bucket_bucket_domain_name
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name               = "vpc-module"
  cidr               = "10.100.0.0/16"
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets    = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  public_subnets     = ["10.100.101.0/24", "10.100.102.0/24", "10.100.103.0/24"]
  enable_nat_gateway = true

  tags = {
    Name      = "VPC from Module"
    Terraform = "true"
  }
}
