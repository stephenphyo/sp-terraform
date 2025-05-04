terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "local" {}
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}
