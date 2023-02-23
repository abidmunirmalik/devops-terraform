data "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/16"
}

data "aws_subnets" "subnets" {
  filter {
    name  = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    "Name" = "*public*"
  }
}


