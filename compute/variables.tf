# Region variables
variable "profile" {
  type = string
}
variable "region" {
  type = string
}

#SSH Keys variables
variable "key_name" {
  type = string
}
variable "public_key" {
  type = string
}
variable "prefix" {
  type = string
}

# Security Group variables
variable "sg_name" {
  type = string
}

variable "ingress_rules" {
  type = set(object({
    description = string
    from_port   = string
    to_port     = string
    protocol    = string
    cidr_blocks = string
  }))
}

# EC2 Variables
variable "instance_type" {
  type = string
}

variable "ec2_name" {
  type = string
}

# EBS Variables
variable "ebs_volumes" {
  type = list(any)
}
