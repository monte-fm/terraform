variable "environment" {
  description = "An environment name that will be prefixed to resource names"
  type        = string
}

variable "kafka_volume_size" {
  description = "The size in GiB of the EBS volume for the data drive on each broker node"
  type        = number
}

variable "kafka_instance_type" {
  type    = string
  default = "kafka.t3.small"
}

variable "kafka_version" {
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR of the main VPC"
  type        = string
}
