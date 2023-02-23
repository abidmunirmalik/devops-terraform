terraform {
  # Terraform version constraint
  required_version = "~> 1.3.0, < 1.4"

  # Terraform Providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "devops"
  region  = "us-east-1"

  default_tags {
    tags = {
      Environment = "Lab"
      provisioner = "Terraform"
      Creator     = "Bob"
    }
  }
}