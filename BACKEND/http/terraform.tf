terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "http" {
    address        = "http://192.168.1.88:9001/terraform_state/4cdd0c76-d78b-11e9-9bea-db9cd8374f3a"
    lock_address   = "http://192.168.1.88:9001/terraform_lock/4cdd0c76-d78b-11e9-9bea-db9cd8374f3a"
    lock_method    = "PUT"
    unlock_address = "http://192.168.1.88:9001/terraform_lock/4cdd0c76-d78b-11e9-9bea-db9cd8374f3a"
    unlock_method  = "DELETE"
  }
}

provider "aws" {
  region = "us-east-1"
}
