terraform {
  required_version = "~> 1.3, < 1.4"
  backend "local" {
    path  = "/tmp/state/terraform.tfstate"
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
