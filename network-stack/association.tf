resource "aws_route_table_association" "a" {
  count          = length(data.aws_subnets.subnets.ids)
  subnet_id      = data.aws_subnets.subnets.ids[count.index]
  route_table_id = aws_route_table.rt.id
}