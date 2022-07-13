resource "aws_route" "public_route" {
  depends_on             = [aws_subnet.solr_subnet]
  route_table_id         = aws_vpc.main.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
