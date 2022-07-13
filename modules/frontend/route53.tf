resource "aws_route53_record" "frontend" {
  depends_on = [aws_cloudfront_distribution.frontend]
  zone_id    = var.hosted_zone_id
  name       = var.domain
  type       = "CNAME"
  ttl        = "60"
  records    = [aws_cloudfront_distribution.frontend.domain_name]
}
