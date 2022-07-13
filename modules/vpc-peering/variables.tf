variable "requester_vpc_name" {
  description = "App name that will be added to resource tag names"
  type        = string
}

variable "accepter_vpc_name" {
  description = "tag name of remote redis VPC"
  type        = string
}

variable "resource_tags" {
  description = "Tags to add into each resource created"
  type        = map(string)
  default     = {}
}
