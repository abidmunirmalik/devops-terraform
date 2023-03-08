resource "digitalocean_vpc" "do_vpc" {
  name     = var.vpc_name
  region   = var.vpc_region
  ip_range = var.vpc_cidr
}