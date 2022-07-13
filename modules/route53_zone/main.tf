resource "aws_route53_zone" "private" {
  name = var.environment

  vpc {
    vpc_id = var.vpc_id
  }
  tags = {
    Name = "${var.environment}"
    ENV  = var.environment
  }
}
