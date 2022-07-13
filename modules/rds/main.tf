resource "aws_rds_cluster" "default" {
  cluster_identifier      = "${var.environment}-${var.stack}-${var.rds_name}"
  engine                  = "aurora-mysql"
  engine_version          = var.db_engine
  database_name           = var.db_name
  master_username         = data.aws_ssm_parameter.db_user.value
  master_password         = data.aws_ssm_parameter.db_passwd.value
  backup_retention_period = var.backup_retention_period
  copy_tags_to_snapshot   = true
  apply_immediately       = true
  skip_final_snapshot     = true
  deletion_protection     = var.rds_deletion_protection
  vpc_security_group_ids  = [aws_security_group.rds_security_group.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.id
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                      = var.db_cluster_size
  identifier                 = "${var.environment}-${var.stack}-${var.rds_name}-${count.index}"
  cluster_identifier         = aws_rds_cluster.default.id
  instance_class             = var.db_instance_type
  engine                     = aws_rds_cluster.default.engine
  engine_version             = aws_rds_cluster.default.engine_version
  db_subnet_group_name       = aws_db_subnet_group.rds_subnet_group.id
  monitoring_interval        = 0
  auto_minor_version_upgrade = false
  copy_tags_to_snapshot      = true

  tags = {
    Name = "${var.environment}-${var.stack} rds"
    ENV  = "${var.environment}-${var.stack}"
  }
}
