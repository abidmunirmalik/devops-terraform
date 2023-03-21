variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "dns_hostname" {
  type    =  bool
  default = true
}

variable "dns_support" {
  type    =  bool
  default = true
}

variable "ipv6" {
  type    = bool
  default = false
}

variable "prefix" {
  type    = string
  default = "lab"
}

variable "vpc_name" {
  type   = string
  default = "main"
}

variable "igw_name" {
  type   = string
  default = "main-igw"
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

variable "rt_name" {
  type = string
}