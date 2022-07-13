variable "environment" {
  description = "An environment name that will be prefixed to resource names"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key_name" {
  description = "Name of ssh key to get access to EC2 instance/bastion"
  type        = string
}

variable "vpc_id" {
  description = "VPC Id of our cluster. This is Mandatory variable"
  type        = string
}

variable "subnet_type" {
  description = "Public/Private/Db"
  type        = string
}

variable "sg_type" {
  description = "public/private/public-ssh"
  type        = string
}

variable "ec2_volume_size" {
  type = number
}

variable "server_name" {
  type = string
}
