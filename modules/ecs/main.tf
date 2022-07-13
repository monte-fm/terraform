data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_vpc" "this" {
  id = var.vpc_id
}

data "aws_ami" "ecs" {
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

data "aws_subnets" "ecs_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["Private subnet for ${var.environment}"]
  }
}

data "aws_subnets" "nlb_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.nlb_subnet_type} subnet for ${var.environment}"]
  }
}

data "aws_ecr_image" "service_name" {
  repository_name = var.docker_image_name
  image_tag       = var.docker_image_tag
}
