terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "stephenphyo-terraform-01"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-lock"
    encrypt        = true

    # Terraform Version >= 1.11 (Enable S3 Native Locking)
    # use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}
