resource "aws_instance" "solr_instance" {
  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = "gp2"
  }

  network_interface {
    network_interface_id = aws_network_interface.network.id
    device_index         = 0
  }

  tags = {
    Name = "SOLR server"
  }
}
