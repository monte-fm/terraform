data "aws_vpc" "requester" {
  tags = {
    Name = var.requester_vpc_name
  }
}

data "aws_vpc" "accepter" {
  tags = {
    Name = var.accepter_vpc_name
  }
}

resource "aws_vpc_peering_connection" "requester" {
  peer_vpc_id = data.aws_vpc.accepter.id
  vpc_id      = data.aws_vpc.requester.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge(
    {
      Name = "${var.accepter_vpc_name}-${var.requester_vpc_name}-peer"
    },
    var.resource_tags,
  )
}
