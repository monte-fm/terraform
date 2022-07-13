variable "cluster_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "nlb_subnet_type" {
  description = "Public/Private"
  type        = string
}

variable "asg_max_size" {
  type    = number
  default = 10
}

variable "asg_min_size" {
  type    = number
  default = 2
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "container_port" {
  default = 80
  type    = number
}

variable "docker_image_name" {
  type = string
}

variable "docker_image_tag" {
  type = string
}

variable "health_endpoint" {
  type        = string
  description = "Health endpoint for NLB"
}

variable "app_profile_name" {
  type        = string
  description = "App profile name"
}

variable "isDaemon" {
  description = "will service as a daemon which means 1 per instance"
  type        = bool
  default     = false
}
