module "vpc" {
  source         = "../modules/terraform-aws-vpc"
  vpc_cidr_block = local.vpc_cidr_block
  dns_hostname   = local.dns_hostname
  dns_support    = local.dns_support
  ipv6           = local.ipv6
  prefix         = local.prefix
  vpc_name       = local.vpc_name
  igw_name       = local.igw_name
  azs            = local.azs
  cidr_blocks    = local.cidr_blocks
  public_ips     = local.public_ips
  subnet_names   = local.subnet_names
  rt_name        = local.rt_name
}

module "ssh" {
  source     = "../modules/terraform-aws-ssh"
  key_name   = local.key_name
  public_key = local.public_key
  prefix     = local.prefix
}

module "sg" {
  source        = "../modules/terraform-aws-sg"
  sg_name       = local.sg_name
  ingress_rules = local.ingress_rules
  prefix        = local.prefix
}

module "ec2" {
  source        = "../modules/terraform-aws-ec2"
  instance_type = local.instance_type
  public_ip     = local.public_ip
  sg_ids        = [module.sg.sg_id]
  key_name      = module.ssh.keypair_name
  ec2_name      = local.ec2_name
  prefix        = local.prefix 
}