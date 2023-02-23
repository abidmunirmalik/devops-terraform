output "vpc_cidr" {
  value = aws_vpc.main_vpc.cidr_block
}