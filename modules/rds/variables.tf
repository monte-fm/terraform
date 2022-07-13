variable "environment" {
  description = "ENV name of our cluster. This is mandatory variable"
}

variable "stack" {
  description = "Env type: env/mysql"
  type        = string
}

variable "db_instance_type" {
  description = "Instance type of RDS MySQL instance"
  type        = string
}

variable "db_name" {
  type = string
}

variable "rds_name" {
  type = string
}

variable "rds_deletion_protection" {
  type        = bool
  default     = false
  description = "Set value to true to prevent RDS deletion over terraform. You can manually disable this option over AWS-UI and use terraform destroy to delete all components"
}

variable "db_engine" {
  type = string
}

variable "backup_retention_period" {
  type    = number
  default = 1
}

variable "db_cluster_size" {
  type    = number
  default = 1
}

variable "rds_storage_size" {
  type = string
}

variable "rds_storage_type" {
  type = string
}

variable "max_rds_storage_size" {
  type = string
}
