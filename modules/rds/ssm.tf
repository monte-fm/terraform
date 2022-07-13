data "aws_ssm_parameter" "db_user" {
  name = "/${var.environment}/rds/user"
}

data "aws_ssm_parameter" "db_passwd" {
  name = "/${var.environment}/rds/password"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.environment}/vpc/id"
}

resource "aws_ssm_parameter" "rds_rw_domain" {
  name  = "/${var.environment}/rds/rw_domain_${var.rds_name}"
  type  = "String"
  value = aws_rds_cluster.default.endpoint
}

resource "aws_ssm_parameter" "rds_ro_domain" {
  name  = "/${var.environment}/rds/ro_domain_${var.rds_name}"
  type  = "String"
  value = aws_rds_cluster.default.reader_endpoint
}
