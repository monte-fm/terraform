variable "vpc_cidr" {
  description = "The CIDR of the main VPC"
  type        = string
}

variable "environment" {
  description = "An environment name that will be prefixed to resource names"
  type        = string
}
