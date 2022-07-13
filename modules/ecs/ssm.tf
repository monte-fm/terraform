data "aws_ssm_parameter" "db_user" {
  name = "/${var.environment}/rds/user"
}

data "aws_ssm_parameter" "db_passwd" {
  name = "/${var.environment}/rds/password"
}

data "aws_ssm_parameter" "rds_rw_domain" {
  name = "/${var.environment}/rds/rw_domain"
}

data "aws_ssm_parameter" "rds_ro_domain" {
  name = "/${var.environment}/rds/ro_domain"
}
