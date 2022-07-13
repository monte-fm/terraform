variable "environment" {
  description = "An environment name that will be prefixed to resource names"
  type        = string
}

variable "stack" {
  description = "Env type: env/mysql"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR of the main VPC"
  type        = string
}
