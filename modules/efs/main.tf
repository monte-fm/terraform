data "aws_subnet_ids" "private_subnet" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = ["Private subnet for ${var.environment}-${var.stack}"]
  }
}

data "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = ["${var.environment}-${var.stack} private sg"]
  }
}
