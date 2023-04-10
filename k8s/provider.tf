terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.19"
    }
  }
}

provider "kubernetes" {
  # Configuration options
}
