# Provider configuration
provider "aws" {
  region = var.aws_region
}

# Terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}