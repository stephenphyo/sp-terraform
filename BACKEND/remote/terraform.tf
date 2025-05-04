terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "stephenphyo"
    workspaces {
      name = "ws-01"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
