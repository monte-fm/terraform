output "s3_webserver_domain" {
  value = aws_s3_bucket_website_configuration.frontend.website_endpoint
}

output "cloudfront_domain" {
  value = aws_cloudfront_distribution.frontend.domain_name
}
