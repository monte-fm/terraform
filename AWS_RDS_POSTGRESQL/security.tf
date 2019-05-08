resource "aws_security_group" "postgres_rds_security_group" {
  description = "RDS group ${var.env_name}.${data.aws_vpc.cluster.id}"
  vpc_id = "${data.aws_vpc.cluster.id}"
  name = "${var.env_name}.${var.base_domain}-postgres-rds-security-group"

  ingress {
    from_port = "5432"
    to_port = "5432"
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}.${var.base_domain}-postgres-rds-security-group"
  }
}