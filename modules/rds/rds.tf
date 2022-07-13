resource "aws_db_instance" "mysql" {
  identifier            = "${var.environment}-${var.stack}-db"
  allocated_storage     = var.rds_storage_size
  storage_type          = var.rds_storage_type
  engine                = "mysql"
  engine_version        = "5.7.31"
  instance_class        = var.db_instance_type
  max_allocated_storage = var.max_rds_storage_size
  # DB configs
  db_name  = var.db_name
  username = data.aws_ssm_parameter.db_user.value
  password = data.aws_ssm_parameter.db_passwd.value
  ## End of DB configs
  monitoring_interval        = 0
  parameter_group_name       = "default.mysql5.7"
  backup_retention_period    = 14
  backup_window              = "02:00-03:00"
  copy_tags_to_snapshot      = true
  apply_immediately          = true
  skip_final_snapshot        = true
  auto_minor_version_upgrade = false
  db_subnet_group_name       = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids     = [aws_security_group.rds_security_group.id]
  deletion_protection        = var.rds_deletion_protection

  tags = {
    Name = "${var.environment}-${var.stack} rds"
    ENV  = "${var.environment}-${var.stack}"
  }
}
