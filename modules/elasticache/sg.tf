resource "aws_security_group" "redis_elasticache" {
  depends_on  = [data.aws_ssm_parameter.vpc_id]
  name        = "${var.environment}-${var.stack} redis SG"
  description = "${var.environment}-${var.stack} redis SG"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  ingress {
    description = "Allow"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.environment}-${var.stack} redis SG"
    ENV   = "${var.environment}"
    Stack = "${var.stack}"
  }
}
