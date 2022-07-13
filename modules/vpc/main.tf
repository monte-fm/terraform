resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    {
      Name = "${var.environment} - VPC"
      ENV  = "${var.environment}"
    }
  )
}

data "aws_availability_zones" "available" {
  state = "available"
}