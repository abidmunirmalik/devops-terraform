resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${var.prefix}-${var.igw_name}"
  }
  depends_on = [aws_vpc.main_vpc]
}
