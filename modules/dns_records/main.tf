resource "aws_route53_record" "subdomain" {
  zone_id = var.dns_zone_id
  name    = var.dns_record_name
  type    = var.dns_record_type
  ttl     = "60"
  records = [var.dns_record_destination]
}
