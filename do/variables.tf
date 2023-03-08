# VPC Variables
variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_region" {
  type = string
}

# Project Variables
variable "project_name" {
  type = string
}

# SSH Key Variables
variable "ssh_key_name" {
  type = string
}

# Images Variables
variable "image_slug" {
  type = string
}

# Droplet Variables
variable "droplet_name" {
  type = string
}

variable "droplet_size" {
  type = string
}

# Database Servers Variables
variable "db_hosts" {
  type = list(string)  
}


