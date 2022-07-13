variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_key_name" {
  description = "Name of ssh key to get access to EC2 instance/bastion"
  type        = string
}

variable "ec2_volume_size" {
  type    = number
  default = 30
}

variable "vpc_cidr" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "dns_name" {
  type = string
}
