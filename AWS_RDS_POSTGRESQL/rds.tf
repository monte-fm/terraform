/**  RDS parameter group
**   To assign RDS parameter group your RDS instance.
*/
resource "aws_db_parameter_group" "postgres_rds_parameters" {
  name = "${var.env_name}-${var.vpc_id}-postgres-rds-parameters"
  family = "postgres9.6"

  parameter {
    name = "client_encoding"
    value = "UTF8"
  }

  parameter {
    name = "max_locks_per_transaction"
    value = "64"
  }

  parameter {
    name = "timezone"
    value = "UTC"
  }

  tags {
    Name = "${var.env_name}-${var.vpc_id}-postgres-rds-parameters"
  }
}

/**
 * Postgres Subnet group.
 * To assign subnets to RDS.
 */
resource "aws_db_subnet_group" "postgres_rds_subnet_group" {
  name = "${var.env_name}.${var.base_domain}-postgres-rds-subnet-group"
  subnet_ids = [
    "${aws_subnet.postgres_rds_subnet_a.id}",
    "${aws_subnet.postgres_rds_subnet_b.id}",
    "${aws_subnet.postgres_rds_subnet_c.id}"
  ]

  tags {
    Name = "${var.env_name}.${var.base_domain}-postgres-rds-subnet-group"
  }
}

/**
 * Postgres RDS instance.
 * Create RDS instance for postgres.
 */
module "postgresql_rds" {
  #Basic variables for RDS
  source = "rds_modules"
  count = "${var.rds_enabled ? 1 : 0}"
  postgres_rds_password = "${var.postgres_rds_password}"
  env_name = "${var.env_name}"
  region = "${var.region}"
  vpc_id = "${var.vpc_id}"
  base_domain = "${var.base_domain}"
  db_subnet_group_name = "${aws_db_subnet_group.postgres_rds_subnet_group.id}"
  parameter_group_name = "${aws_db_parameter_group.postgres_rds_parameters.id}"
  vpc_security_group_ids = "${aws_security_group.postgres_rds_security_group.id}"
  rds_multi_az_enabled = "${var.rds_multi_az_enabled}"
  rds_deletion_protection = "${var.rds_deletion_protection}"
  rds_iops = "${var.rds_iops}"
  skip_final_snapshot = "${var.rds_skip_final_snapshot}"
  #Configurable variables for RDS
  postgres_rds_instance_class = "${var.postgres_rds_instance_class}"
  rds_storage_type = "${var.rds_storage_type}"
  rds_storage_size = "${var.rds_storage_size}"
  rds_provision_file = "rds_modules/rds_provision/postgres.sql"
  postgres_rds_replica_instance_class = "${var.postgres_rds_replica_instance_class}"
  rds_identifier = "${var.env_name}-${var.vpc_id}"
  dns_rds_identifier = "postgres"
  replica_rds_identifier = "replica-${var.env_name}-${var.vpc_id}"
  rds_replica_enabled = "${var.rds_replica_enabled ? 1 : 0}"
}