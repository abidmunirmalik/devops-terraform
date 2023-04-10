terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.19"
    }
  }
}

provider "kubernetes" {
  host     = "https://kubernetes.docker.internal:6443"
  insecure = true
  token    = var.token
}
