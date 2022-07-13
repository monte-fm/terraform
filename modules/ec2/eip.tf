resource "aws_eip" "eip" {
  count             = var.subnet_type == "Public" ? 1 : 0
  vpc               = true
  network_interface = aws_network_interface.network.id
  tags = {
    Name = "${var.environment} - public IP for EC2"
    ENV  = "${var.environment}"
  }
}
