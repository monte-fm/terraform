data "aws_ami" "linux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["amazon"]
}

data "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = ["${var.environment} ${var.sg_type} sg"]
  }
}

data "aws_subnets" "ec2_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.subnet_type} subnet for ${var.environment}"]
  }
}
