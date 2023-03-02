# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block                       = var.vpc_cidr_block
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    "Name" = "${var.prefix}-${var.vpc_name}"
  }
}
