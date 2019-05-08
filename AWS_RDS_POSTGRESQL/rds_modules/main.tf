/**
 * Postgres RDS instance.
 * Create RDS instance for postgres.
 */
resource "aws_db_instance" "postgres_rds_instance" {
  count = "${var.count ? 1 : 0}"
  engine = "postgres"
  engine_version = "9.6.11"
  instance_class = "${var.postgres_rds_instance_class}"
  port = "5432"
  name = "nextiva_db"
  username = "nextiva"
  password = "${var.postgres_rds_password}"
  identifier = "${var.rds_identifier}"
  vpc_security_group_ids = [
    "${var.vpc_security_group_ids}"
  ]
  db_subnet_group_name = "${var.db_subnet_group_name}"
  parameter_group_name = "${var.parameter_group_name}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
  final_snapshot_identifier = "${var.env_name}-${var.vpc_id}"
  publicly_accessible = false
  auto_minor_version_upgrade = false
  multi_az = "${var.rds_multi_az_enabled}"
  backup_retention_period = 1
  backup_window = "05:00-06:00"
  deletion_protection = "${var.rds_deletion_protection}"
  storage_type = "${var.rds_storage_type}"
  allocated_storage = "${var.rds_storage_size}"
  iops = "${var.rds_iops}"
  copy_tags_to_snapshot = true

  provisioner "local-exec" {
    environment {
      # for instance, postgres would need the password here:
      PGPASSWORD = "${var.postgres_rds_password}"
    }
    command = "printenv && psql --host=${self.address} --port=5432 --username=${self.username} --dbname=${self.name} -a -f ${var.rds_provision_file}"
  }

  tags {
    Name = "${var.rds_identifier}"
  }
}

/**
 * Postgres RDS instance.
 * Create RDS instance for postgres replica.
 */
resource "aws_db_instance" "replica_of_postgres_rds_instance" {
  count = "${var.rds_replica_enabled ? 1 : 0}"
  engine = "postgres"
  engine_version = "9.6.11"
  replicate_source_db = "${aws_db_instance.postgres_rds_instance.identifier}"
  instance_class = "${var.postgres_rds_replica_instance_class}"
  storage_type = "gp2"
  allocated_storage = "${var.rds_storage_size}"
  publicly_accessible = false
  skip_final_snapshot = true
  auto_minor_version_upgrade = false
  deletion_protection = "${var.rds_deletion_protection}"
  multi_az = false
  identifier = "${var.replica_rds_identifier}"
  
  tags {
    Name = "${var.replica_rds_identifier}"
  }
}
