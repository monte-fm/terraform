variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC."
  type        = string
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "tf_state_bucket_name" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "dynamodb_terraform_state_lock_name" {
  description = "The name of the dynamoDB table. It's required for TF state lock."
  type        = string
}

variable "aws_region" {
  description = "AWS region where resources will be provisioned."
}

variable "account_id" {
  description = "ID of AWS account"
  type        = number
}

variable "environment" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_ssh_key_name" {
  type = string
}
