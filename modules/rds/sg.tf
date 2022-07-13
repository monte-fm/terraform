resource "aws_security_group" "rds_security_group" {
  description = "RDS group ${var.environment}-${var.stack}-${var.rds_name}"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
  name        = "${var.environment}-${var.stack}-${var.rds_name}"

  ingress {
    from_port   = "3306"
    to_port     = "3306"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-${var.stack}-${var.rds_name}"
    ENV  = "${var.environment}-${var.stack}"
  }
}
