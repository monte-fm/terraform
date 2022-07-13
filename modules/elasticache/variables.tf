variable "environment" {
  description = "An environment name that will be prefixed to resource names"
  type        = string
}

variable "stack" {
  description = "Service type of Env"
  type        = string
}

variable "redis_node_type" {
  description = "EC2 machine size for redis"
  type        = string
}

variable "parameter_group_name" {
  type    = string
  default = "default.redis6.x.cluster.on"
}

variable "redis_cluster_size" {
  type    = number
  default = 1
}

variable "replicas_size" {
  description = "Value between 0-5"
  type        = number
  default     = 1
}

variable "engine_version" {
  type    = string
  default = "6.x"
}

variable "route53_zone_id" {
  type = string
}
