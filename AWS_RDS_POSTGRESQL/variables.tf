variable "rds_skip_final_snapshot" {
  default = true
}

variable "region" {
  default = "us-west-2"
}

variable "vpc_id" {
  description = "VPC Id of our cluster. This is Mandatory variable"
}

variable "env_name" {
  description = "ENV name of our cluster. This is Mandatory variable"
}

variable "base_domain" {
  description = "Base domain of our cluster. This is Mandatory variable"
}

variable "postgres_rds_password" {
  description = "Postgres RDS password. This is Mandatory variable"
}

variable "rds_enabled" {
  description = "should RDS instances be created"
  default = false
}

variable "postgres_rds_instance_class" {
  default = "db.t2.micro"
  description = "Postgres RDS instance class"
}

variable "postgres_rds_replica_instance_class" {
  default = "db.t2.micro"
}

variable "rds_storage_size" {
  default = 25
  description = "Allocated storage size in gigabytes: minimum 20Gb for gp2 and 100Gb for io1"
}

variable "rds_storage_type" {
  default = "gp2"
  description = "You could use gp2 for ondemand envs or io1 in production env"
}

variable "rds_multi_az_enabled" {
  default = false
  description = "Set true for production env"
}

variable "rds_replica_enabled" {
  default = false
  description = "Set true for production env"
}

variable "rds_deletion_protection" {
  default = false
  description = "Set true for production env"
}

variable "rds_iops" {
  default = 0
}

variable "cluster_subnet_cidr_database_a" {
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}

variable "cluster_subnet_cidr_database_b" {
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}

variable "cluster_subnet_cidr_database_c" {
  description = "Cluster CIDR for creating subnets. This is Mandatory variable"
}
