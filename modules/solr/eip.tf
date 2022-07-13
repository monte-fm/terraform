resource "aws_eip" "eip" {
  vpc               = true
  network_interface = aws_network_interface.network.id
  tags = {
    Name = "Public IP for SOLR"
  }
}
