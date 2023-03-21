# VPC module
locals {
  vpc_cidr_block = "192.168.0.0/16"
  dns_hostname   = true
  dns_support    = true
  ipv6           = false
  prefix         = "lab"
  vpc_name       = "devops"
  igw_name       = "igw"
  azs            = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
  cidr_blocks    = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24"]
  public_ips     = [true, false, true, false]
  subnet_names   = ["public-subnet-1a", "private-subnet-1b", "public-subnet-1c", "private-subnet-1d"]
  rt_name        = "internet-route"
}

# SSH Module
locals {
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHRkb4F2zH9gyXHzItguVMpVqZc/Sjj4dZM1ahGSIVV7 AWS-Golden-Key"
  key_name   = "aws-golden-key"
}

# Security Group Module
locals {
  sg_name = "ec2-sg"

  ingress_rules = [
    {
      "description" = "SSH from internet"
      "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
    },
    {
      "description" = "HTTP from internet"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "tcp"
      "cidr_blocks" = "0.0.0.0/0"
    },
    {
      "description" = "Ping from internet"
      "from_port"   = 0
      "to_port"     = 0
      "protocol"    = "icmp"
      "cidr_blocks" = "0.0.0.0/0"
    }
  ]
}

# EC2 Module
locals {
  instance_type   = "t2.micro"
  ec2_name        = "webserver"
  public_ip       = true
}