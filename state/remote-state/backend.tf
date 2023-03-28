terraform {
  required_version = "~> 1.3, < 1.4"
  backend "s3" {
    bucket  = "bob-tr-state-file-backend"
    key     = "projects/devops/terraform/terraform.tfstate"
    region  = "us-east-1"
    profile = "devops"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "devops"
  region  = "us-east-1"
}
