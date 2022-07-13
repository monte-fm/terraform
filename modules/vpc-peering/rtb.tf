
data "aws_route_tables" "requester" {
  vpc_id = data.aws_vpc.requester.id
}

data "aws_route_tables" "accepter" {
  vpc_id = data.aws_vpc.accepter.id
}

resource "aws_route" "requester" {
  depends_on                = [data.aws_route_tables.requester]
  count                     = length(data.aws_route_tables.requester.ids)
  route_table_id            = sort(data.aws_route_tables.requester.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
}

resource "aws_route" "accepter" {
  depends_on                = [data.aws_route_tables.accepter]
  count                     = length(data.aws_route_tables.accepter.ids)
  route_table_id            = sort(data.aws_route_tables.accepter.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
}
