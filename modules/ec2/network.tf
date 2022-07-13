resource "aws_network_interface" "network" {
  subnet_id   = sort(data.aws_subnets.ec2_subnet.ids)[0]
  description = "${var.environment}-${var.subnet_type} subnet"
  tags = {
    Name = "${var.environment}-${var.subnet_type} network interface"
  }
  security_groups = [data.aws_security_group.sg.id]
}
