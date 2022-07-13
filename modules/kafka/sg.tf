resource "aws_security_group" "kafka" {
  description = "${var.environment} kafka security group"
  vpc_id      = aws_vpc.main.id
  name        = "${var.environment} kafka"

  ingress {
    from_port   = "9092"
    to_port     = "9092"
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr, "0.0.0.0/0"]
  }

  ingress {
    from_port   = "9094"
    to_port     = "9094"
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr, "0.0.0.0/0"]
  }

  ingress {
    from_port   = "2181"
    to_port     = "2181"
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr, "0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment} kafka cluster"
    ENV  = "${var.environment}"
  }
}
