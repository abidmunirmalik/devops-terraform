resource "aws_vpc" "main_vpc" {
  cidr_block                       = var.vpc_cidr_block
  enable_dns_hostnames             = var.dns_hostname
  enable_dns_support               = var.dns_support
  assign_generated_ipv6_cidr_block = var.ipv6

  tags = {
    "Name" = "${var.prefix}-${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${var.prefix}-${var.igw_name}"
  }
  depends_on = [aws_vpc.main_vpc]
}

resource "aws_subnet" "subnet" {
  count                   = length(var.cidr_blocks)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.cidr_blocks[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = var.public_ips[count.index]

  tags = {
    Name = "${var.prefix}-${var.subnet_names[count.index]}"
  }
  depends_on = [aws_vpc.main_vpc]
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "${var.prefix}-${var.rt_name}"
  }
  depends_on = [aws_vpc.main_vpc, aws_internet_gateway.igw]
}

resource "aws_route_table_association" "association" {
  count             = length(data.aws_subnets.public_subnets.ids)
  subnet_id         = data.aws_subnets.public_subnets.ids[count.index]
  route_table_id    = aws_route_table.rt.id

  depends_on = [data.aws_subnets.public_subnets]
}