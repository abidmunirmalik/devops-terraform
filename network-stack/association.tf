resource "aws_route_table_association" "association" {
  count             = length(data.aws_subnets.public_subnets.ids)
  subnet_id         = data.aws_subnets.public_subnets.ids[count.index]
  route_table_id    = aws_route_table.rt.id

  depends_on = [data.aws_subnets.public_subnets]
}
