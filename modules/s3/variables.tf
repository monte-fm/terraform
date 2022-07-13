variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "bucket_access_acl" {
  description = "Valid values are: private/public-read/public-read-write/authenticated-read/aws-exec-read/log-delivery-write"
  default     = "private"
  type        = string
}
