variable "prefix" {
  type = string
}

# VPC variables
variable "vpc_cidr_block" {
  type = string
}
variable "vpc_name" {
  type = string
}

# IGW variables
variable "igw_name" {
  type = string
}


# Subnet variables
variable "azs" {
  type = list(string)
}
variable "cidr_blocks" {
  type = list(string)
}
variable "public_ips" {
  type = list(bool)
}
variable "subnet_names" {
  type = list(string)
}

# Route Table variables
variable "rt_name" {
  type = string
}