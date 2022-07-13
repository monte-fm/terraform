variable "environment" {
  description = "An environment name that will be prefixed to resource names"
  type        = string
}

variable "domain" {
  description = "Domain name of Cloudfront resource"
  type        = string
}

variable "acm_certificate_arn" {
  description = "Custom domain certificate arn in AWS Certificate Manager"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted Zone id of root domain"
  type        = string
}
