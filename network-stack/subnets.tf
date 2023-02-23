resource "aws_subnet" "subnet" {
    count                   = length(var.cidr_blocks)
    vpc_id                  = aws_vpc.main_vpc.id
    cidr_block              = var.cidr_blocks[count.index]
    availability_zone       = var.azs[count.index]
    map_public_ip_on_launch = var.public_ips[count.index]

    tags = {
      Name = "${var.prefix}-${var.subnet_names[count.index]}"
  }
}