resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    "Name" = "${var.prefix}-${var.rt_name}"
  }
}