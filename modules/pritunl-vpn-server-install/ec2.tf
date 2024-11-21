data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "pritunl" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = var.ec2_instance_type
  subnet_id               = element(module.vpc.public_subnets, 0)
  disable_api_termination = true
  key_name                = var.ec2_ssh_key_name
  vpc_security_group_ids  = [module.security_group.security_group_id]
  iam_instance_profile    = aws_iam_instance_profile.pritunl_instance_profile.name

  root_block_device {
    volume_type = "gp3"
    throughput  = 200
    volume_size = 50
    tags = {
      Name = "pritunl-root-ebs"
    }
  }
  user_data = file("${path.module}/files/install_vpn_server.sh")

  lifecycle {
    ignore_changes = [ami, key_name]
  }

  tags = {
    Name        = "Pritunl VPN ${var.cluster_name}"
    Environment = var.environment
    Region      = var.aws_region
    AccountId   = var.account_id
  }
}
