terraform {
  # Terraform version constraint
  required_version = "~> 1.3.0, < 1.4"

  # Terraform Providers
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  # Configuration options
}
