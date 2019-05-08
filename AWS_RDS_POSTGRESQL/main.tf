/**
 * Setup AWS provider.
 */
provider "aws" {
  region = "${var.region}"
}


data "aws_caller_identity" "current" {}

data "aws_route53_zone" "base_zone" {
  name = "${var.base_domain}"
}

terraform {
  backend "s3" {
    key = "terraform.tfstate"
    encrypt = true
  }
}

data "aws_vpc" "cluster" {
  id = "${var.vpc_id}"
}
